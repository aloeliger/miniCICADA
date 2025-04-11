import FWCore.ParameterSet.Config as cms

HTCalculator = cms.EDAnalyzer(
    'HT_Calculator',
    jetSrc = cms.InputTag('slimmedJets'),
    muonSrc = cms.InputTag('slimmedMuons'),
)
