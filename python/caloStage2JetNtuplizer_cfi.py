import FWCore.ParameterSet.Config as cms

caloStage2JetNtuplizer = cms.EDAnalyzer(
    'caloStage2JetNtuplizer',
    JetSrc = cms.InputTag("caloStage2Digis", "Jet")
)