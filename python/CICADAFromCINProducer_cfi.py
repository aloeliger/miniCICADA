import FWCore.ParameterSet.Config as cms

CICADAv1FromCINv1Producer = cms.EDProducer(
    'CICADAv1FromPredictionProducer',
    predictionSource=cms.InputTag('CICADAInputNetworkProducerv1p0','regionPrediction'),
    CICADAModelVersion=cms.string('CICADA/CICADAModel_v1')
)

CICADAv2FromCINv1Producer = cms.EDProducer(
    'CICADAv2FromPredictionProducer',
    predictionSource=cms.InputTag('CICADAInputNetworkProducerv1p0','regionPrediction'),
    CICADAModelVersion=cms.string('CICADA/CICADAModel_v2')
)
