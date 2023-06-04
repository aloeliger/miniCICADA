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
37