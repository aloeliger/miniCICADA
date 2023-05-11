import h5py
import ROOT
import numpy as np
import multiprocessing
import random
import math

from checkScoreOnDisk import theFiles
#from createHDF5shuffle_files import fileSize, batchSize

import argparse

def getNCands(nCands: int, theList: list, typeObj, sortMethod = lambda x: x.pt):
    listOfCands = []
    theList.sort(reverse=True, key = sortMethod)
    if len(theList) < nCands:
        for i in range(nCands-len(theList)):
            theList.append(typeObj.new())
    for i in range(nCands):
        listOfCands.append(theList[i])
    return listOfCands

def createGenericList(info, nObjs: int, typeObj):
    theList = []
    for i in range(info.nObjects):
        theList.append(typeObj.new(entry=i, tree=info))
    theList = getNCands(
        nCands = nObjs,
        theList = theList,
        typeObj = typeObj,
    )
    resultList = [info.nObjects]
    for cand in theList:
        resultList += cand.toList()
    return resultList


class caloEGamma():
    def __init__(self, entry=0, tree=None):
        if tree != None:
            self.et = tree.etVector[entry]
            self.eta = tree.etaVector[entry]
            self.mt = tree.mtVector[entry]
            self.phi = tree.phiVector[entry]
            self.pt = tree.ptVector[entry]
        else:
            self.et = 0.0
            self.eta = 0.0
            self.mt = 0.0
            self.phi = 0.0
            self.pt = 0.0
    def toList(self):
        return [
            self.pt,
            self.eta,
            self.phi,
            self.mt,
            self.et,
        ]
    @staticmethod
    def new(entry=0, tree=None):
        return caloEGamma(entry=entry, tree=tree)
    
#On average 2.4 an event, but up to 12
def createEGammaInfo(EGammaInformation):
    return createGenericList(
        info = EGammaInformation,
        nObjs = 3,
        typeObj = caloEGamma
    )

#On average, about 4 an event, but up to 12
class caloJet():
    def __init__(self, entry=0, tree=None):
        if tree != None:
            self.et = tree.etVector[entry]
            self.eta = tree.etaVector[entry]
            self.mt = tree.mtVector[entry]
            self.phi = tree.phiVector[entry]
            self.pt = tree.ptVector[entry]
        else:
            self.et = 0.0
            self.eta = 0.0
            self.mt = 0.0
            self.phi = 0.0
            self.pt = 0.0
    def toList(self):
        return [
            self.pt,
            self.eta,
            self.phi,
            self.mt,
            self.et,
        ]
    @staticmethod
    def new(entry=0, tree=None):
        return caloJet(entry=entry, tree=tree)

def createJetInfo(JetInformation):
    return createGenericList(
        info = JetInformation,
        nObjs = 4,
        typeObj = caloJet
    )

#Average is 10.56, however it heavily skews to 12 tau objects
class caloTau():
    def __init__(self, entry=0, tree=None):
        if tree != None:
            self.et = tree.etVector[entry]
            self.eta = tree.etaVector[entry]
            self.mt = tree.mtVector[entry]
            self.phi = tree.phiVector[entry]
            self.pt = tree.ptVector[entry]
        else:
            self.et = 0.0
            self.eta = 0.0
            self.mt = 0.0
            self.phi = 0.0
            self.pt = 0.0
    def toList(self):
        return [
            self.pt,
            self.eta,
            self.phi,
            self.mt,
            self.et,
        ]
    @staticmethod
    def new(entry=0, tree=None):
        return caloTau(entry=entry, tree=tree)
#We're just going to take the leading 4
def createTauInfo(TauInformation):
    return createGenericList(
        info=TauInformation,
        nObjs=4,
        typeObj=caloTau,
    )

#There are _always_ 12 of these
class caloEtSum():
    def __init__(self, entry=0, tree=None):
        if tree != None:
            self.et = tree.etVector[entry]
            self.mt = tree.mtVector[entry]
            self.pt = tree.ptVector[entry]
            self.type = tree.typeVector[entry]
        else:
            self.et = 0.0
            self.mt = 0.0
            self.pt = 0.0
            self.type = -1
    #28 different sum types
    def encodeType(self):
        theList = [0.0 for i in range(28)]
        if self.type >= 0:
            theList[self.type] = 1.0
        return theList
    def toList(self):
        return [
            self.pt,
            self.mt,
            self.et,
            *self.encodeType()
        ]
    @staticmethod
    def new(entry=0, tree=None):
        return caloEtSum(entry=entry, tree=tree)

#We'll take the top 4 of these
def createEtSumInfo(EtSumInformation):
    return createGenericList(
        info=EtSumInformation,
        nObjs=4,
        typeObj=caloEtSum,
    )

class pfCand():
    def __init__(self, entry=0, tree=None):
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

    def toList(self):
        return [
            self.pt,
            self.eta,
            self.phi,
            self.mass,
            self.et,
            self.charge,
            self.vx,
            self.vy,
            self.vz,
            self.dxy,
            self.dz
        ]

    @staticmethod
    def new(entry=0, tree=None):
        return pfCand(entry=entry,tree=tree)

def createPfCandInfo(pfCandInfo, nCands=2):
    return createGenericList(
        info=pfCandInfo,
        nObjs=nCands,
        typeObj = pfCand,
    )

def makeInputListFromEntry(
        EGammaInformation,
        JetInformation,
        TauInformation,
        EtSumInformation,
        PileupInformation,
        MetInformation,
        # electronPFCands,
        # gammaPFCands,
        # chargedHadronPFCands,
        # neutralHadronPFCands,
):
    resultList = []

    resultList.append(PileupInformation.npv)
    resultList.append(MetInformation.METpt)

    resultList += createEGammaInfo(EGammaInformation)
    resultList += createJetInfo(JetInformation)
    resultList += createTauInfo(TauInformation)
    resultList += createEtSumInfo(EtSumInformation)
    
    # resultList += createPfCandInfo(pfCandInfo=electronPFCands)
    # resultList += createPfCandInfo(pfCandInfo=gammaPFCands)
    # resultList += createPfCandInfo(pfCandInfo=chargedHadronPFCands)
    # resultList += createPfCandInfo(pfCandInfo=neutralHadronPFCands)

    return resultList

def createHDF5File(fileIndex, fileEntries, fileSize):
    anomalyChain = ROOT.TChain("L1TCaloSummaryTestNtuplizer/L1TCaloSummaryOutput")

    # chargedHadronPFchain = ROOT.TChain("chargedHadronPFcandidateAnalyzer/chargedHadronPFcands")
    # neutralHadronPFchain = ROOT.TChain("neutralHadronPFcandidateAnalyzer/neutralHadronPFcands")
    # muonPFchain = ROOT.TChain("muonPFcandidateAnalyzer/muonPFcands")
    # electronPFchain = ROOT.TChain("electronPFcandidateAnalyzer/electronPFcands")
    # gammaPFchain = ROOT.TChain("gammaPFcandidateAnalyzer/gammaPFcands")

    chains = []
    EGammaChain = ROOT.TChain("caloStage2EGammaNtuplizer/L1CaloEgammaInformation")
    chains.append(EGammaChain)

    JetChain = ROOT.TChain("caloStage2JetNtuplizer/L1CaloJetInformation")
    chains.append(JetChain)

    TauChain = ROOT.TChain("caloStage2TauNtuplizer/L1CaloTauInformation")
    chains.append(TauChain)

    EtSumChain = ROOT.TChain("caloStage2EtSumNtuplizer/L1CaloEgammaInformation")
    chains.append(EtSumChain)

    metChain = ROOT.TChain("metInformationNtuplizer/metInformation")
    chains.append(metChain)

    PUChain = ROOT.TChain("pileupInformationNtuplizer/pileupInformation")
    chains.append(PUChain)

    # electronPFCandChain = ROOT.TChain("electronPFcandidateAnalyzer/electronPFcands")
    # chains.append(electronPFCandChain)

    # gammaPFCandChain = ROOT.TChain("gammaPFcandidateAnalyzer/gammaPFcands")
    # chains.append(gammaPFCandChain)

    # chargedHadronPFchain = ROOT.TChain("chargedHadronPFcandidateAnalyzer/chargedHadronPFcands")
    # chains.append(chargedHadronPFchain)

    # neutralHadronPFchain = ROOT.TChain("neutralHadronPFcandidateAnalyzer/neutralHadronPFcands")
    # chains.append(neutralHadronPFchain)

    for fileName in theFiles:
        anomalyChain.Add(fileName)

        # chargedHadronPFchain.Add(fileName)
        # neutralHadronPFchain.Add(fileName)
        # muonPFchain.Add(fileName)
        # electronPFchain.Add(fileName)
        # gammaPFchain.Add(fileName)
        # metChain.Add(fileName)
        # PUChain.Add(fileName)
        for chain in chains:
            chain.Add(fileName)
    
    with h5py.File(f'HDF5InProgress/output_file{fileIndex}.hdf5','w') as theFile:
        for index, entryNum in enumerate(fileEntries):
            anomalyChain.GetEntry(entryNum)

            # chargedHadronPFchain.GetEntry(entryNum)
            # neutralHadronPFchain.GetEntry(entryNum)
            # muonPFchain.GetEntry(entryNum)
            # electronPFchain.GetEntry(entryNum)
            # gammaPFchain.GetEntry(entryNum)
            # metChain.GetEntry(entryNum)
            # PUChain.GetEntry(entryNum)
            for chain in chains:
                chain.GetEntry(entryNum)
            

            # inputList = makeInputListFromEntry(
            #     PUInformation=PUChain,
            #     metInformation=metChain,
            #     chargedHadronPFcands=chargedHadronPFchain,
            #     neutralHadronPFcands=neutralHadronPFchain,
            #     muonPFcands=muonPFchain,
            #     electronPFcands=electronPFchain,
            #     gammaPFcands=gammaPFchain
            # )
            inputList = makeInputListFromEntry(
                EGammaInformation=EGammaChain,
                JetInformation=JetChain,
                TauInformation=TauChain,
                EtSumInformation=EtSumChain,
                PileupInformation=PUChain,
                MetInformation=metChain,
                # electronPFCands=electronPFCandChain,
                # gammaPFCands=gammaPFCandChain,
                # chargedHadronPFCands=chargedHadronPFchain,
                # neutralHadronPFCands=neutralHadronPFchain
            )
            if index == 0:
                inputDset = theFile.create_dataset('input',(fileSize,len(inputList)))
                outputDset = theFile.create_dataset('output',(fileSize,1))

            inputDset[index] = np.array(inputList)
            outputDset[index] = np.array([anomalyChain.anomalyScore])



if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Create local shuffled HDF5 files from root files")
    parser.add_argument('--numJobs',default=48,type=int,help="number of local jobs to perform. Defaults to 48")
    parser.add_argument('--batch',default=0,type=int,help="Batch of files to begin preparing")
    parser.add_argument('--fileSize',default=3200,type=int,help="Number of entries to put in a file")
    args = parser.parse_args()

    #numJobs = 48
    
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

    for groupNum in range(math.ceil(len(entryNumbers)/args.fileSize)):
        subgroup = []
        for indexNum in range(args.fileSize):
            entryIndex = groupNum*args.fileSize+indexNum
            if entryIndex >= len(entryNumbers):
                break
            else:
                subgroup.append(entryNumbers[entryIndex])
        finalEntryGroups.append(subgroup)
    print(len(finalEntryGroups))

    #mappedInput = [(i, finalEntryGroups[i]) for i in range(48,96)]
    mappedInput = [(i, finalEntryGroups[i], args.fileSize) 
                   for i in range(args.batch*args.numJobs, (args.batch+1)*args.numJobs)]

    with multiprocessing.Pool() as thePool:
        thePool.starmap(
            createHDF5File,
            mappedInput,
        )