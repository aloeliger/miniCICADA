import FWCore.ParameterSet.Config as cms

miniCICADAAnalyzer = cms.EDAnalyzer(
    'miniCICADAAnalyzer',
    scoreSource = cms.InputTag("miniCICADAProducer","miniCICADAScore"),
)