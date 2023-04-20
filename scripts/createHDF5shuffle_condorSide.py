#!/usr/bin/env python3
import h5py
import ROOT
#from checkScoreOnDisk import theFiles
import argparse
#from createHDF5shuffle_files import fileSize,batchSize
import time
#from createMiniCICADA import *
import numpy as np

import os

basePath = '/hdfs/store/user/aloelige'
""" filePaths = (
    f'{basePath}/EphemeralZeroBias2/CICADA_EphemeralZeroBias2_15Apr2023/230415_073918/0000/',
    f'{basePath}/EphemeralZeroBias4/CICADA_EphemeralZeroBias4_15Apr2023/230415_081348/0000/',
    f'{basePath}/EphemeralZeroBias7/CICADA_EphemeralZeroBias7_15Apr2023/230415_081443/0000/',
) """

filePaths = (
    f'{basePath}/EphemeralZeroBias2/CICADA_EphemeralZeroBias2_15Apr2023/',
    f'{basePath}/EphemeralZeroBias4/CICADA_EphemeralZeroBias4_15Apr2023/',
    f'{basePath}/EphemeralZeroBias7/CICADA_EphemeralZeroBias7_15Apr2023/',
)

theFiles = []

for filePath in filePaths:
    for root, dirs, files in os.walk(filePath, topdown=True):
        for name in files:
            theFiles.append(os.path.join(root, name))

fileSize = 3200
batchSize = 32

class pfCand():
    def __init__ (self, entry=0, tree=None):
        if tree != None:
            self.pt = tree.ptVector[entry]
            self.eta = tree.etaVector[entry]
            self.phi = tree.phiVector[entry]
            self.mass = tree.massVector[entry]
            self.et = tree.etVector[entry]
            self.charge = tree.chargeVector[entry]
            self.mt = tree.mtVector[entry]
            self.vx = tree.vxVector[entry]
            self.vy = tree.vyVector[entry]
            self.vz = tree.vzVector[entry]
            self.dxy = tree.dxyVector[entry]
            self.dz = tree.dzVector[entry]
        else:
            self.pt = 0.0  
            self.eta = 0.0
            self.phi = 0.0
            self.mass = 0.0
            self.et = 0.0
            self.charge = 0.0
            self.mt = 0.0
            self.vx = 0.0
            self.vy = 0.0
            self.vz = 0.0
            self.dxy = 0.0
            self.dz = 0.0
    def toList (self):
        theList = [
            self.pt,
            self.eta,
            self.phi,
            self.mass,
            self.et,
            self.charge,
            self.mt,
            self.vx,
            self.vy,
            self.vz,
            self.dxy,
            self.dz,
        ]
        return theList
    
class slimmedElectron():
    def __init__(self, entry=0, tree=None):
        if tree != None:
            self.pt = tree.ptVector[entry]
            self.eta = tree.etaVector[entry]
            self.phi = tree.phiVector[entry]
            self.mass = tree.massVector[entry]
            self.charge = tree.chargeVector[entry]
        else:
            self.pt = 0.0
            self.eta = 0.0
            self.phi = 0.0
            self.mass = 0.0
            self.charge = 0.0
    def toList(self):
        theList = [
            self.pt,
            self.eta,
            self.phi,
            self.mass,
            self.charge
        ]

def getLeadingNCands(nCands: int, theList: list[pfCand]):
    listOfCands = []
    theList.sort(reverse=True, key = lambda x: x.pt)
    if len(theList) < nCands:
        for i in range(nCands - len(theList)):
            theList.append(pfCand())
    for i in range(nCands):
        listOfCands.append(theList[i])
    return listOfCands

def createChargedHadronPFcandInfo(chargedHadronPFcands):
    theList = []
    for i in range(chargedHadronPFcands.nObjects):
        theList.append(pfCand(entry=i,tree=chargedHadronPFcands))

    theList = getLeadingNCands(
        nCands=2,
        theList=theList
    )

    resultList = [chargedHadronPFcands.nObjects]
    for cand in theList:
        resultList += cand.toList()
    
    return resultList

def createNeutralHadronPFcandInfo(neutralHadronPFcands):
    theList = []
    for i in range(neutralHadronPFcands.nObjects):
        theList.append(pfCand(entry=i,tree=neutralHadronPFcands))

    theList = getLeadingNCands(
        nCands=2,
        theList=theList
    )

    resultList = [neutralHadronPFcands.nObjects]
    for cand in theList:
        resultList += cand.toList()
    
    return resultList

def createMuonPFcandInfo(muonPFcands):
    theList = []
    for i in range(muonPFcands.nObjects):
        theList.append(pfCand(entry=i,tree=muonPFcands))

    theList = getLeadingNCands(
        nCands=2,
        theList=theList
    )

    resultList = [muonPFcands.nObjects]
    for cand in theList:
        resultList += cand.toList()
    
    return resultList

def createElectronPFcandInfo(electronPFcands):
    theList = []
    for i in range(electronPFcands.nObjects):
        theList.append(pfCand(entry=i,tree=electronPFcands))

    theList = getLeadingNCands(
        nCands=2,
        theList=theList
    )

    resultList = [electronPFcands.nObjects]
    for cand in theList:
        resultList += cand.toList()
    
    return resultList

def createGammaPFcandInfo(gammaPFcands):
    theList = []
    for i in range(gammaPFcands.nObjects):
        theList.append(pfCand(entry=i,tree=gammaPFcands))

    theList = getLeadingNCands(
        nCands=2,
        theList=theList
    )

    resultList = [gammaPFcands.nObjects]
    for cand in theList:
        resultList += cand.toList()
    
    return resultList

def createSlimmedElectronInfo(slimmedElectrons):
    theList = []
    for i in range(slimmedElectrons.nElectrons):
        theList.append(slimmedElectron(entry=i, tree=slimmedElectrons))
    
    theList = getLeadingNCands(
        nCands = 2,
        theList = theList
    )

    resultList = []
    for cand in theList:
        resultList += cand.toList()
    
    return resultList

def makeInputListFromEntry(
        chargedHadronPFcands, 
        neutralHadronPFcands, 
        muonPFcands, 
        electronPFcands, 
        gammaPFcands, 
        #slimmedElectrons.
        ):
    resultList = []

    resultList += createChargedHadronPFcandInfo(chargedHadronPFcands=chargedHadronPFcands)
    resultList += createNeutralHadronPFcandInfo(neutralHadronPFcands=neutralHadronPFcands)
    resultList += createMuonPFcandInfo(muonPFcands=muonPFcands)
    resultList += createElectronPFcandInfo(electronPFcands=electronPFcands)
    resultList += createGammaPFcandInfo(gammaPFcands=gammaPFcands)
    #resultList += createSlimmedElectronInfo(slimmedElectrons=slimmedElectrons)

    return resultList

def main(args):
    print(f'Attempting to create input from {args.inputFile} as the input file')

    if "root://" in args.inputFile:
        trueInputFileName = args.inputFile[args.inputFile.find("/hdfs"):]
        print(f'Input file name after processing: {trueInputFileName}')
    else:
        trueInputFileName = args.inputFile

    print(f'And will attempt to output a shuffle file called {args.outputFile}')

    with open(trueInputFileName) as inputFile:
        inputFileContents = inputFile.read()
    entries = inputFileContents.split('\n')
    entries.remove('')
    entries = [int(entry) for entry in entries]

    anomalyChain = ROOT.TChain("L1TCaloSummaryTestNtuplizer/L1TCaloSummaryOutput")

    chargedHadronPFchain = ROOT.TChain("chargedHadronPFcandidateAnalyzer/chargedHadronPFcands")
    neutralHadronPFchain = ROOT.TChain("neutralHadronPFcandidateAnalyzer/neutralHadronPFcands")
    muonPFchain = ROOT.TChain("muonPFcandidateAnalyzer/muonPFcands")
    electronPFchain = ROOT.TChain("electronPFcandidateAnalyzer/electronPFcands")
    gammaPFchain = ROOT.TChain("gammaPFcandidateAnalyzer/gammaPFcands")

    print('Adding files to chains...')
    for fileName in theFiles:
        anomalyChain.Add(fileName)

        chargedHadronPFchain.Add(fileName)
        neutralHadronPFchain.Add(fileName)
        muonPFchain.Add(fileName)
        electronPFchain.Add(fileName)
        gammaPFchain.Add(fileName)
    print('Chains prepared. Starting shuffle...')

    startTime = time.perf_counter()
    with h5py.File(f'{args.outputFile}','w') as theFile:
        inputDset = theFile.create_dataset('input',(fileSize,125), chunks=(batchSize,125))
        outputDset = theFile.create_dataset('output',(fileSize,1), chunks=(batchSize,1))

        for index, entryNum in enumerate(entries):
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
    endTime = time.perf_counter()
    print(f'created complete shuffle in {endTime-startTime:0.2f} seconds')

if __name__=='__main__':
    parser = argparse.ArgumentParser(description='Shuffle miniCICADA files from the condor side')
    parser.add_argument('--inputFile',nargs='?',required=True,help='Text file describing the entries to take, one per line')
    parser.add_argument('--outputFile',nargs='?',required=True,help='output file name')

    args = parser.parse_args()

    main(args)
