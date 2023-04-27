import FWCore.ParameterSet.Config as cms

caloStage2TauNtuplizer = cms.EDAnalyzer(
    'caloStage2TauNtuplizer',
    TauSrc = cms.InputTag("caloStage2Digis", "Tau")
)