import ROOT

from tensorflow import keras
import numpy as np
from tqdm import trange
from sklearn.model_selection import train_test_split

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

def main():
    theFile = ROOT.TFile('/nfs_scratch/aloeliger/miniCICADATest.root')
    basicInfoTree = theFile.l1EventTree.Get("L1EventTree")

    nEntries = basicInfoTree.GetEntries()
    
    chargedHadronPFcands = theFile.chargedHadronPFcandidateAnalyzer.Get("chargedHadronPFcands")
    neutralHadronPFcands = theFile.neutralHadronPFcandidateAnalyzer.Get("neutralHadronPFcands")
    muonPFcands = theFile.muonPFcandidateAnalyzer.Get("muonPFcands")
    electronPFcands = theFile.electronPFcandidateAnalyzer.Get("electronPFcands")
    gammaPFcands = theFile.gammaPFcandidateAnalyzer.Get("gammaPFcands")

    #slimmedElectrons = theFile.electronInformationAnalyzer.Get("ElectronInformation")

    CICADAInfo = theFile.L1TCaloSummaryTestNtuplizer.Get("L1TCaloSummaryOutput")

    trainingInfo = []
    resultInfo = []
    for i in trange(nEntries):
        chargedHadronPFcands.GetEntry(i)
        neutralHadronPFcands.GetEntry(i)
        muonPFcands.GetEntry(i)
        electronPFcands.GetEntry(i)
        gammaPFcands.GetEntry(i)
        slimmedElectrons.GetEntry(i)

        CICADAInfo.GetEntry(i)

        entry = makeInputListFromEntry(
            chargedHadronPFcands=chargedHadronPFcands,
            neutralHadronPFcands=neutralHadronPFcands,
            muonPFcands=muonPFcands,
            electronPFcands=electronPFcands,
            gammaPFcands=gammaPFcands,
            #slimmedElectrons=slimmedElectrons
        )

        trainingInfo.append(entry)

        resultInfo.append([CICADAInfo.anomalyScore])
    
    trainingInfo = np.array(trainingInfo)
    resultInfo = np.array(resultInfo)
    print(trainingInfo.shape)
    print(resultInfo.shape)

    xTrain, xVal, yTrain, yVal = train_test_split(
        trainingInfo,
        resultInfo,
        test_size = 0.3,
        random_state=1234
    )

    model = keras.models.Sequential([
        keras.layers.InputLayer(input_shape=[trainingInfo.shape[1]]),
        keras.layers.Dense(100),
        keras.layers.ReLU(),
        keras.layers.Dense(50),
        keras.layers.ReLU(),
        keras.layers.Dense(1)
    ])

    model.compile(
        loss='mse',
        optimizer='nadam',
        metrics=[keras.metrics.RootMeanSquaredError()]
    )

    model.summary()

    model.fit(
        xTrain,
        yTrain,
        epochs=10,
        validation_data=(xVal,yVal)
    )

if __name__ == '__main__':
    main()