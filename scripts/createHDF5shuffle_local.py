import h5py
import ROOT
import numpy as np
import multiprocessing
import random
import math

from checkScoreOnDisk import theFiles
from createHDF5shuffle_files import fileSize, batchSize
from createMiniCICADA import *

def createHDF5File(index, fileEntries):
    anomalyChain = ROOT.TChain("L1TCaloSummaryTestNtuplizer/L1TCaloSummaryOutput")

    chargedHadronPFchain = ROOT.TChain("chargedHadronPFcandidateAnalyzer/chargedHadronPFcands")
    neutralHadronPFchain = ROOT.TChain("neutralHadronPFcandidateAnalyzer/neutralHadronPFcands")
    muonPFchain = ROOT.TChain("muonPFcandidateAnalyzer/muonPFcands")
    electronPFchain = ROOT.TChain("electronPFcandidateAnalyzer/electronPFcands")
    gammaPFchain = ROOT.TChain("gammaPFcandidateAnalyzer/gammaPFcands")

    for fileName in theFiles:
        anomalyChain.Add(fileName)

        chargedHadronPFchain.Add(fileName)
        neutralHadronPFchain.Add(fileName)
        muonPFchain.Add(fileName)
        electronPFchain.Add(fileName)
        gammaPFchain.Add(fileName)
    
    with h5py.File(f'testHDF5/output_file{index}.hdf5','w') as theFile:
        inputDset = theFile.create_dataset('input',(fileSize,125), chunks=(batchSize,125))
        outputDset = theFile.create_dataset('output',(fileSize,1), chunks=(batchSize,1))

        for index, entryNum in enumerate(fileEntries):
            anomalyChain.GetEntry(entryNum)

            chargedHadronPFchain.GetEntry(entryNum)
            neutralHadronPFchain.GetEntry(entryNum)
            muonPFchain.GetEntry(entryNum)
            electronPFchain.GetEntry(entryNum)
            gammaPFchain.GetEntry(entryNum)

            inputList = makeInputListFromEntry(
                chargedHadronPFcands=chargedHadronPFchain,
                neutralHadronPFcands=neutralHadronPFchain,
                muonPFcands=muonPFchain,
                electronPFcands=electronPFchain,
                gammaPFcands=gammaPFchain
            )
            inputDset[index] = np.array(inputList)
            outputDset[index] = np.array([anomalyChain.anomalyScore])



if __name__ == '__main__':
    numJobs = 48
    
    print(len(theFiles))

    anomalyChain = ROOT.TChain("L1TCaloSummaryTestNtuplizer/L1TCaloSummaryOutput")
    for fileName in theFiles:
        anomalyChain.Add(fileName)
    
    totalEntries = anomalyChain.GetEntries()
    print(totalEntries)

    del anomalyChain
    entryNumbers = [x for x in range(totalEntries)]

    random.seed(1234)
    random.shuffle(entryNumbers)

    finalEntryGroups = []

    for groupNum in range(math.ceil(len(entryNumbers)/fileSize)):
        subgroup = []
        for indexNum in range(fileSize):
            entryIndex = groupNum*fileSize+indexNum
            if entryIndex >= len(entryNumbers):
                break
            else:
                subgroup.append(entryNumbers[entryIndex])
        finalEntryGroups.append(subgroup)
    print(len(finalEntryGroups))

    mappedInput = [(i, finalEntryGroups[i]) for i in range(48,96)]

    with multiprocessing.Pool() as thePool:
        thePool.starmap(
            createHDF5File,
            mappedInput,
        )