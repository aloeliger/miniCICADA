import h5py
import numpy as np
from checkScoreOnDisk import theFiles
import time
import ROOT
import random
import math
from createMiniCICADA import *
import multiprocessing

fileSize = 320
batchSize = 32

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



def main():
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
    # print(len(finalEntryGroups[0]))
    # print(len(finalEntryGroups[718]))
    # print(len(finalEntryGroups[719]))
    start_time = time.perf_counter()
    createHDF5File(
        index=0,
        fileEntries=finalEntryGroups[0],
    )
    end_time = time.perf_counter()
    print(f'File written in {end_time-start_time:.3f} seconds')

    # mappedInput = [(i, finalEntryGroups[i]) for i in range(1,11)]

    # start_time = time.perf_counter()

    # with multiprocessing.Pool() as thePool:
    #     thePool.starmap(
    #         createHDF5File,
    #         mappedInput,
    #     )

    # end_time = time.perf_counter()
    # print(f'10 Files written in {end_time-start_time:.3f} seconds with multiprocessing')

    # totalFilesToProcess = 48*3
    # mappedInput = [(i, finalEntryGroups[i]) for i in range(totalFilesToProcess)]

    # start_time = time.perf_counter()

    # with multiprocessing.Pool() as thePool:
    #     thePool.starmap(
    #         createHDF5File,
    #         mappedInput,
    #     )
    # end_time = time.perf_counter()
    # print(f'Test input made in {end_time-start_time:0.3f} seconds')

if __name__ == '__main__':
    main()