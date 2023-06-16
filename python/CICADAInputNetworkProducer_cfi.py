import FWCore.ParameterSet.Config as cms

CICADAInputNetworkProducerv1p0 = cms.EDProducer(
    'CICADAInputNetworkProducer',
    EGammaSrc = cms.InputTag("caloStage2Digis", "EGamma"),
    JetSrc = cms.InputTag("caloStage2Digis", "Jet"),
    TauSrc = cms.InputTag("caloStage2Digis", "Tau"),
    EtSrc = cms.InputTag("caloStage2Digis", "EtSum"),
    CICADAInputNetworkLocation = cms.string("/src/anomalyDetection/miniCICADA/data/CICADAInputNetwork_v1/"),
)