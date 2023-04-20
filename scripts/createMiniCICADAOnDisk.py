from createMiniCICADA import *
#from checkScoreOnDisk import theFiles
import ROOT
import numpy as np
from sklearn.model_selection import train_test_split
import random
import h5py
import math
import os

""" class miniCICADAGenerator(keras.utils.Sequence):
    def __init__(self, fileNames, batch_size=32):
        self.fileNames = fileNames
        self.batch_size = batch_size

        self.anomalyChain = ROOT.TChain("L1TCaloSummaryTestNtuplizer/L1TCaloSummaryOutput")

        self.chargedHadronPFchain = ROOT.TChain("chargedHadronPFcandidateAnalyzer/chargedHadronPFcands")
        self.neutralHadronPFchain = ROOT.TChain("neutralHadronPFcandidateAnalyzer/neutralHadronPFcands")
        self.muonPFchain = ROOT.TChain("muonPFcandidateAnalyzer/muonPFcands")
        self.electronPFchain = ROOT.TChain("electronPFcandidateAnalyzer/electronPFcands")
        self.gammaPFchain = ROOT.TChain("gammaPFcandidateAnalyzer/gammaPFcands")

        for name in fileNames:
            self.anomalyChain.Add(name)

            self.chargedHadronPFchain.Add(name)
            self.neutralHadronPFchain.Add(name)
            self.muonPFchain.Add(name)
            self.electronPFchain.Add(name)
            self.gammaPFchain.Add(name)
        #we currently shuffle based on files
        #but we want to be able to shuffle the entries between those files
        #So to do so, we introduce a random mapping of the entries in the generator
        #to entires as they exist in the chain
        self.randomMapping = [i for i in range(self.anomalyChain.GetEntries())]
        random.seed(1234)
        random.shuffle(self.randomMapping)

        self.randomMapping = dict(enumerate(self.randomMapping))
    
    def __len__(self):
        return np.ceil(self.anomalyChain.GetEntries()/self.batch_size).astype(int)
    
    def __getitem__(self, idx):
        lowEntry = idx * self.batch_size
        highEntry = min(self.anomalyChain.GetEntries(), (idx+1)*self.batch_size)
        xInfo = []
        yInfo = []
        
        for i in range(lowEntry,highEntry):
            self.anomalyChain.GetEntry(self.randomMapping[i])

            self.chargedHadronPFchain.GetEntry(self.randomMapping[i])
            self.neutralHadronPFchain.GetEntry(self.randomMapping[i])
            self.muonPFchain.GetEntry(self.randomMapping[i])
            self.electronPFchain.GetEntry(self.randomMapping[i])
            self.gammaPFchain.GetEntry(self.randomMapping[i])

            xInfo.append(makeInputListFromEntry(
                chargedHadronPFcands=self.chargedHadronPFchain,
                neutralHadronPFcands=self.neutralHadronPFchain,
                muonPFcands=self.muonPFchain,
                electronPFcands=self.electronPFchain,
                gammaPFcands=self.gammaPFchain
            ))

            yInfo.append([self.anomalyChain.anomalyScore])
        
        return np.array(xInfo), np.array(yInfo) """

class miniCICADAGenerator(keras.utils.Sequence):
    def __init__(self, fileNames, batch_size=32, batchesPerFile=100):
        self.fileNames = fileNames
        self.batch_size = batch_size
        self.batchesPerFile = batchesPerFile
    
    def __len__(self):
        return self.batchesPerFile*len(self.fileNames)
    
    def __getitem__(self, idx):
        fileNum = math.floor(idx/self.batchesPerFile)

        batchIndex = idx % self.batchesPerFile

        with h5py.File(self.fileNames[fileNum]) as theFile:
            inputDset = theFile['input']
            outputDset = theFile['output']

            inputBatch = inputDset[batchIndex*self.batch_size:(batchIndex+1)*self.batch_size]
            outputBatch = outputDset[batchIndex*self.batch_size:(batchIndex+1)*self.batch_size]

            return inputBatch, outputBatch

if __name__ == '__main__':
    theFiles = []
    for root, dirs, files, in os.walk('testHDF5', topdown=True):
        for name in files:
            theFiles.append(os.path.join(root, name))

    trainFiles, valFiles = train_test_split(theFiles, train_size=0.7, random_state=1234)

    print(len(trainFiles))
    print(len(valFiles))

    with open('./trainingAndValidationFiles.txt','w') as theFile:
        theFile.write('Training Files:\n')
        for trainFile in trainFiles:
            theFile.write(f'{trainFile}\n')
        theFile.write('Validation Files:\n')
        for valFile in valFiles:
            theFile.write(f'{valFile}\n')

    trainGenerator = miniCICADAGenerator(fileNames=trainFiles)
    valGenerator = miniCICADAGenerator(fileNames=valFiles)

    print(len(trainGenerator))
    print(len(valGenerator))

    batchShape = trainGenerator[0][0].shape
    print(batchShape)
    print(valGenerator[0][0].shape)

    model = keras.models.Sequential([
        keras.layers.InputLayer(input_shape=[batchShape[1]]),
        keras.layers.BatchNormalization(),
        keras.layers.Dense(100),
        keras.layers.ReLU(),
        keras.layers.Dropout(0.3),
        keras.layers.Dense(75),
        keras.layers.ReLU(),
        keras.layers.Dense(50),
        keras.layers.ReLU(),
        keras.layers.Dense(1)
    ])

    model.compile(
        loss='mse',
        optimizer='nadam',
        metrics=[keras.metrics.RootMeanSquaredError()],
    )

    model.summary()

    checkpointCallback = keras.callbacks.ModelCheckpoint(
        "./miniCICADAModel",
        monitor = 'val_loss',
        save_best_only = True,
    )
    LRScheduler = keras.callbacks.ReduceLROnPlateau(
        monitor="val_loss",
        patience = 5,
    )
    nanTermination = keras.callbacks.TerminateOnNaN()

    model.fit(
        x=trainGenerator,
        epochs=100,
        validation_data=valGenerator,
        steps_per_epoch = 1000,
        #validation_steps = 100,
        callbacks = [
            checkpointCallback,
            LRScheduler,
            nanTermination,
        ],
        #workers=4,
        #use_multiprocessing=True
    )