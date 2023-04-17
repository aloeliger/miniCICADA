import FWCore.ParameterSet.Config as cms

pileupInformationNtuplizer = cms.EDAnalyzer(
    'pileupInformationNtuplizer',
    pvSrc = cms.InputTag("offlineSlimmedPrimaryVertices")
)