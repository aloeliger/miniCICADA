import h5py
import os
from tqdm import tqdm

concatenatePath = '/nfs_scratch/aloeliger/HDF5InProgress/'

listOfFileNames = []
for root, dirs, files in os.walk(concatenatePath, topdown=True):
    for name in files:
        listOfFileNames.append(os.path.join(concatenatePath, name))

listOfFiles = [h5py.File(name, 'r') for name in listOfFileNames]

with h5py.File('/nfs_scratch/aloeliger/testHDF5Files/largeInputFile.hdf5', 'w') as destinationFile:
    destinationInputDSet = destinationFile.create_dataset('input', shape=(0,195), maxshape=(None,195), dtype =listOfFiles[0]['input'].dtype)
    destinationCicadaInputDset = destinationFile.create_dataset('cicadaInput', shape=(0,18,14), maxshape=(None,18,14), dtype=listOfFiles[0]['cicadaInput'].dtype)
    destinationScoreDSet = destinationFile.create_dataset('anomalyScore', shape=(0,1), maxshape=(None,1), dtype = listOfFiles[0]['anomalyScore'].dtype)
    destinationPUDSet = destinationFile.create_dataset('pileup', shape=(0,1), maxshape=(None,1), dtype=listOfFiles[0]['pileup'].dtype)

    for theFile in tqdm(listOfFiles):
        inputDSet = theFile['input']
        cicadaInputDSet = theFile['cicadaInput']
        scoreDSet = theFile['anomalyScore']
        pileupDSet = theFile['pileup']

        destinationInputDSet.resize(destinationInputDSet.shape[0]+inputDSet.shape[0], axis=0)
        destinationCicadaInputDset.resize(destinationCicadaInputDset.shape[0]+cicadaInputDSet.shape[0], axis=0)
        destinationScoreDSet.resize(destinationScoreDSet.shape[0]+scoreDSet.shape[0],axis=0)
        destinationPUDSet.resize(destinationPUDSet.shape[0]+pileupDSet.shape[0], axis=0)

        destinationInputDSet[-inputDSet.shape[0]:] = inputDSet[:]
        destinationCicadaInputDset[-cicadaInputDSet.shape[0]:] = cicadaInputDSet[:]
        destinationScoreDSet[-scoreDSet.shape[0]:] = scoreDSet[:]
        destinationPUDSet[-pileupDSet.shape[0]:] = pileupDSet[:]

        theFile.close()