import FWCore.ParameterSet.Config as cms

caloStage2EtSumNtuplizer = cms.EDAnalyzer(
    'caloStage2EtSumNtuplizer',
    EtSumSrc = cms.InputTag("caloStage2Digis", "EtSum")
)