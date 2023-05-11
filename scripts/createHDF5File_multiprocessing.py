import h5py
import ROOT
import numpy as np
from L1Trigger.miniCICADA.scriptIncludes.candidates import *
from L1Trigger.miniCICADA.scriptIncludes.fileList import theFiles
import time
from tqdm import trange
import multiprocessing

def prepareInputChains():
    chains = {
        'anomalyChain':ROOT.TChain("L1TCaloSummaryTestNtuplizer/L1TCaloSummaryOutput"),
        'EGammaChain': ROOT.TChain("caloStage2EGammaNtuplizer/L1CaloEgammaInformation"),
        'JetChain': ROOT.TChain("caloStage2JetNtuplizer/L1CaloJetInformation"),
        'TauChain': ROOT.TChain("caloStage2TauNtuplizer/L1CaloTauInformation"),
        'EtSumChain': ROOT.TChain("caloStage2EtSumNtuplizer/L1CaloEtSumInformation"),
        'METChain': ROOT.TChain("metInformationNtuplizer/metInformation"),
        'PUChain': ROOT.TChain("pileupInformationNtuplizer/pileupInformation"),
        'electronCounter': ROOT.TChain('electronCounter/objectCounts'),
        'jetCounter': ROOT.TChain('jetCounter/objectCounts'),
        'fatJetCounter': ROOT.TChain('fatJetCounter/objectCounts'),
        'photonCounter': ROOT.TChain('photonCounter/objectCounts'),
        'tauCounter': ROOT.TChain('tauCounter/objectCounts'),
        'boostedTauCounter': ROOT.TChain('boostedTauCounter/objectCounts')
    }

    for fileName in theFiles:
        for chainName in chains:
            chains[chainName].Add(fileName)

    return chains

def create2DListOfCandidates(theChain, objType = caloCandidate, numberOfEntries=12):
    candidateList = []
    for i in range(numberOfEntries):
        if i<theChain.nObjects:
            candidate = objType(
                entry=i,
                tree=theChain,
            )
        else:
            candidate = objType()
        candidateList.append(candidate.toList())
    candidateList.sort(reverse=True, key=lambda x: x[0])#sort based on pt
    return candidateList

def createModelInputList(chainDict):
    electronCands = create2DListOfCandidates(chainDict['EGammaChain'])[:4]
    jetCands = create2DListOfCandidates(chainDict['JetChain'])[:4]
    tauCands = create2DListOfCandidates(chainDict['TauChain'])[:4]
    EtSums = create2DListOfCandidates(chainDict['EtSumChain'], objType=caloEtSum)[:4]

    modelInput = [
        chainDict['PUChain'].npv,
        chainDict['METChain'].METpt,
        chainDict['EGammaChain'].nObjects,
        *[electronProperty for electron in electronCands for electronProperty in electron],
        chainDict['JetChain'].nObjects,
        *[jetProperty for jet in jetCands for jetProperty in jet],
        chainDict['TauChain'].nObjects,
        *[tauProperty for tau in tauCands for tauProperty in tau],
        *[EtSumProperty for EtSum in EtSums for EtSumProperty in EtSum],
        chainDict['electronCounter'].nObjects,
        chainDict['jetCounter'].nObjects,
        chainDict['fatJetCounter'].nObjects,
        chainDict['photonCounter'].nObjects,
        chainDict['tauCounter'].nObjects,
        chainDict['boostedTauCounter'].nObjects,
    ]

    return modelInput

def createHDF5File(taskNumber: int, entryRange: tuple):
    chains = prepareInputChains()

    firstEntry = True
    entriesToProcess = entryRange[1]-entryRange[0]
    # print(f'Entry range {entryRange}')
    # print(f'Entries to process: {entriesToProcess}')
    #with h5py.File(f'/nfs_scratch/aloeliger/HDF5InProgress/largeInputFile_{taskNumber}.hdf5','w') as theFile:
    theFile = h5py.File(f'/nfs_scratch/aloeliger/HDF5InProgress/largeInputFile_{taskNumber}.hdf5','w')
    for index in range(entryRange[0], entryRange[1]):
        for chainName in chains:
            chains[chainName].GetEntry(index)
        anomalyScoreArray = np.array([chains['anomalyChain'].anomalyScore])
        modelInput = np.array(createModelInputList(chains))

        if firstEntry:
            inputDSet = theFile.create_dataset('input',(entriesToProcess, *modelInput.shape))
            scoreDSet = theFile.create_dataset('anomalyScore', (entriesToProcess, *anomalyScoreArray.shape))
            firstEntry = False
        fileIndex = index - (taskNumber*entriesToProcess)
        inputDSet[fileIndex] = modelInput
        scoreDSet[fileIndex] = anomalyScoreArray
    theFile.close()

def main():
    chains = prepareInputChains()

    totalEntries = chains['anomalyChain'].GetEntries()
    print(f'Total entries represented: {totalEntries}')

    poolSize = 48

    processableEntries = totalEntries - (totalEntries%poolSize)
    entriesPerProcess = int(processableEntries/poolSize)

    print(f'Will process {processableEntries} in {poolSize} processes')
    print(f'With {entriesPerProcess} entries per process')

    mappedInput = [
        (i, (i*entriesPerProcess, (i+1)*entriesPerProcess))
        for i in range(poolSize)
    ]

    # print(mappedInput)

    print('Starting multiprocessing pool')
    startTime = time.perf_counter()
    with multiprocessing.Pool(poolSize) as thePool:
        thePool.starmap(
            createHDF5File,
            mappedInput,
        )
    # createHDF5File(*mappedInput[0])
    endTime = time.perf_counter()
    print(f'Complete in {endTime-startTime:.2f} seconds')

if __name__ == '__main__':
    main()