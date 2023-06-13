import FWCore.ParameterSet.Config as cms

miniCICADAProducer = cms.EDProducer(
    'miniCICADAProducer',
    miniCICADAModelLocation = cms.string("/src/anomalyDetection/miniCICADA/data/miniCICADA_v1p0/miniCICADAModel/"),
    pvSrc = cms.InputTag("offlineSlimmedPrimaryVertices"),
    metSrc = cms.InputTag("slimmedMETs"),
    EGammaSrc = cms.InputTag("caloStage2Digis", "EGamma"),
    JetSrc = cms.InputTag("caloStage2Digis", "Jet"),
    TauSrc = cms.InputTag("caloStage2Digis", "Tau"),
    EtSrc = cms.InputTag("caloStage2Digis", "EtSum"),
    slimmedElectronSrc = cms.InputTag("slimmedElectrons"),
    slimmedJetSrc = cms.InputTag("slimmedJets"),
    slimmedFatJetSrc = cms.InputTag("slimmedJetsAK8"),
    slimmedPhotonSrc = cms.InputTag("slimmedPhotons"),
    slimmedTauSrc = cms.InputTag("slimmedTaus"),
    slimmedBoostedTauSrc = cms.InputTag("slimmedTausBoosted"),
)

miniCICADAProducerCICADAv1 = cms.EDProducer(
    'miniCICADAProducer',
    miniCICADAModelLocation = cms.string("/src/anomalyDetection/miniCICADA/data/miniCICADA_v1p0_CICADAv1/miniCICADAModel/"),
)

miniCICADAv1p1_CICADAv1 = cms.EDProducer(
    'miniCICADAProducer',
    miniCICADAModelLocation = cms.string("/src/anomalyDetection/miniCICADA/data/miniCICADAv1p1_CICADAv1")
)