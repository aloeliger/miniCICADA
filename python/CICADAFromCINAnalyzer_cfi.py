import FWCore.ParameterSet.Config as cms

CICADAv1FromCINv1Analyzer = cms.EDAnalyzer(
    'CICADAFromPredictionAnalyzer',
    scoreSource = cms.InputTag('CICADAv1FromCINv1Producer', 'anomalyScore'),
)

CICADAv2FromCINv1Analyzer = cms.EDAnalyzer(
    'CICADAFromPredictionAnalyzer',
    scoreSource = cms.InputTag('CICADAv2FromCINv1Producer', 'anomalyScore')
)