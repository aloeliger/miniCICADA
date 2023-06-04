import h5py
from createHDF5File_multiprocessing import prepareInputChains, create2DListOfCandidates, createCICADAInputArray
import time
import multiprocessing
from anomalyDetection.miniCICADA.scriptIncludes.candidates import *
import numpy as np

def createHDF5File(taskNumber: int, entryRange: tuple):
    chains = prepareInputChains()

    firstEntry = True
    entriesToProcess = entryRange[1] - entryRange[0]

    theFile = h5py.File(f'/nfs_scratch/aloeliger/HDF5InProgress/largeInputFile_{taskNumber}.hdf5','w')
    for index in range(entryRange[0], entryRange[1]):
        for chainName in chains:
            chains[chainName].GetEntry(index)
        cicadaInput = np.array(createCICADAInputArray(chains['anomalyChain']))
        
        electronCands = create2DListOfCandidates(chains['EGammaChain'])
        electronCands = np.array([electronProperty for electron in electronCands for electronProperty in electron])
        
        jetCands = create2DListOfCandidates(chains['JetChain'])
        jetCands = np.array([jetProperty for jet in jetCands for jetProperty in jet])

        tauCands = create2DListOfCandidates(chains['TauChain'])
        tauCands = np.array([tauProperty for tau in tauCands for tauProperty in tau])

        EtSums = create2DListOfCandidates(chains['EtSumChain'], objType=caloEtSum)
        EtSums = np.array([EtSumProperty for EtSum in EtSums for EtSumProperty in EtSum])
     
        if firstEntry:
            cicadaInputDSet = theFile.create_dataset('cicadaInput', (entriesToProcess, *cicadaInput.shape))
            electronDSet = theFile.create_dataset('electrons', (entriesToProcess, *electronCands.shape))
            jetDSet = theFile.create_dataset('jets', (entriesToProcess, *jetCands.shape))
            tauDSet = theFile.create_dataset('taus', (entriesToProcess, *tauCands.shape))
            EtSumDSet = theFile.create_dataset('EtSums', (entriesToProcess, *EtSums.shape))
            firstEntry=False
        fileIndex = index - (taskNumber*entriesToProcess)
        cicadaInputDSet[fileIndex] = cicadaInput
        electronDSet[fileIndex] = electronCands
        jetDSet[fileIndex] = jetCands
        tauDSet[fileIndex] = tauCands
        EtSumDSet[fileIndex] = EtSums
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