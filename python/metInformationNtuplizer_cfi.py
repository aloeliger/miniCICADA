import FWCore.ParameterSet.Config as cms

metInformationNtuplizer = cms.EDAnalyzer(
    'metInformationNtuplizer',
    metSrc = cms.InputTag("slimmedMETs"),
)