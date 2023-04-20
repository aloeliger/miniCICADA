import h5py
import numpy as np
import math
import os
from sklearn.model_selection import train_test_split
from tensorflow import keras

class miniCICADAGenerator(keras.utils.Sequence):
    def __init__(self, fileNames, batch_size=32):
        self.fileNames = fileNames
        self.batch_size = batch_size

    def __len__(self):
        return 10*len(self.fileNames)
    
    def __getitem__(self,idx):
        fileNum = math.floor(idx/10)

        batchIndex = idx % 10

        with h5py.File(f'testHDF5/output_file{fileNum}.hdf5') as theFile:
            inputDset = theFile['input']
            outputDset = theFile['output']

            inputBatch = inputDset[batchIndex*self.batch_size:(batchIndex+1)*self.batch_size]
            outputBatch = outputDset[batchIndex*self.batch_size:(batchIndex+1)*self.batch_size]

            return inputBatch, outputBatch

def main():
    theFiles = []
    for root,dirs, files in os.walk('/hdfs/store/user/aloelige/testHDF5/',topdown=True):
        for name in files:
            theFiles.append(name)
    
    print(len(theFiles))
    trainFiles, valFiles = train_test_split(theFiles, train_size=0.7, random_state=1234)
    print(len(trainFiles))
    print(len(valFiles))

    trainGenerator = miniCICADAGenerator(fileNames=trainFiles)
    valGenerator = miniCICADAGenerator(fileNames=valFiles)

    batchShape = trainGenerator[0][0].shape
    resultShape = trainGenerator[0][1].shape
    print(batchShape)
    print(resultShape)
    print(len(trainGenerator))

    model = keras.models.Sequential([
        keras.layers.InputLayer(input_shape=[batchShape[1]]),
        keras.layers.BatchNormalization(),
        keras.layers.Dense(100),
        keras.layers.ReLU(),
        keras.layers.BatchNormalization(),
        keras.layers.Dense(75),
        keras.layers.ReLU(),
        keras.layers.BatchNormalization(),
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
        epochs=10,
        validation_data=valGenerator,
        #steps_per_epoch = 1000,
        #validation_steps = 100,
        callbacks = [
            #checkpointCallback,
            LRScheduler,
            nanTermination,
        ],
        #workers=4,
        #use_multiprocessing=True
    )

if __name__ == '__main__':
    main()