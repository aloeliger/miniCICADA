import FWCore.ParameterSet.Config as cms

CICADAInputNetworkAnalyzerv1p0 = cms.EDAnalyzer(
    'CICADAInputNetworkAnalyzer',
    predictionSource=cms.InputTag("CICADAInputNetworkProducerv1p0","regionPrediction")
)