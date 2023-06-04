import h5py
import os
from tqdm import tqdm

concatenatePath = '/nfs_scratch/aloeliger/HDF5InProgress/'

listOfFileNames = []
for root, dirs, files in os.walk(concatenatePath, topdown=True):
    for name in files:
        listOfFileNames.append(os.path.join(concatenatePath, name))

listOfFiles = [h5py.File(name, 'r') for name in listOfFileNames]

with h5py.File('/nfs_scratch/aloeliger/testHDF5Files/largeSplitInputFile.hdf5', 'w') as destinationFile:
    destinationCicadaInputDset = destinationFile.create_dataset('cicadaInput', shape=(0,18,14), maxshape=(None,18,14), dtype=listOfFiles[0]['cicadaInput'].dtype)
    destinationElectronDset = destinationFile.create_dataset('electrons', shape=(0,60), maxshape=(None, 60))
    destinationJetDset = destinationFile.create_dataset('jets', shape=(0,60), maxshape=(None, 60))
    destinationTauDset = destinationFile.create_dataset('taus', shape=(0,60), maxshape=(None, 60))
    destinationEtSumDset = destinationFile.create_dataset('EtSums', shape=(0,372), maxshape=(None, 372))

    for theFile in tqdm(listOfFiles):
        cicadaInputDataset = theFile['cicadaInput']
        electronDataset = theFile['electrons']
        jetDataset = theFile['jets']
        tauDataset = theFile['taus']
        EtSumDataset = theFile['EtSums']

        destinationCicadaInputDset.resize(destinationCicadaInputDset.shape[0]+cicadaInputDataset.shape[0], axis=0)
        destinationElectronDset.resize(destinationElectronDset.shape[0]+electronDataset.shape[0], axis=0)
        destinationJetDset.resize(destinationJetDset.shape[0]+jetDataset.shape[0], axis=0)
        destinationTauDset.resize(destinationTauDset.shape[0]+tauDataset.shape[0], axis=0)
        destinationEtSumDset.resize(destinationEtSumDset.shape[0]+EtSumDataset.shape[0], axis=0)

        destinationCicadaInputDset[-cicadaInputDataset.shape[0]:] = cicadaInputDataset[:]
        destinationElectronDset[-electronDataset.shape[0]:] = electronDataset[:]
        destinationJetDset[-jetDataset.shape[0]:] = jetDataset[:]
        destinationTauDset[-tauDataset.shape[0]:] = tauDataset[:]
        destinationEtSumDset[-EtSumDataset.shape[0]:] = EtSumDataset[:] 

        theFile.close()        