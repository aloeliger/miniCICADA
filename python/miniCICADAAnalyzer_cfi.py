import FWCore.ParameterSet.Config as cms

miniCICADAAnalyzer = cms.EDAnalyzer(
    'miniCICADAAnalyzer',
    scoreSource = cms.InputTag("miniCICADAProducer","miniCICADAScore"),
)

miniCICADAAnalyzerCICADAv1 = cms.EDAnalyzer(
    'miniCICADAAnalyzer',
    scoreSource = cms.InputTag("miniCICADAProducerCICADAv1","miniCICADAScore")
)

miniCICADAv1p1AnalyzerCICADAv1 = cms.EDAnalyzer(
    'miniCICADAAnalyzer',
    scoreSource = cms.InputTag("miniCICADAv1p1_CICADAv1", "miniCICADAScore")
)