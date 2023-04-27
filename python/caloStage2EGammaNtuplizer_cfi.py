import FWCore.ParameterSet.Config as cms

caloStage2EGammaNtuplizer = cms.EDAnalyzer(
    'caloStage2EGammaNtuplizer',
    EGammaSrc = cms.InputTag("caloStage2Digis", "EGamma")
)