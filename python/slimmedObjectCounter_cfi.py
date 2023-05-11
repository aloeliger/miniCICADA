import FWCore.ParameterSet.Config as cms

electronCounter = cms.EDAnalyzer(
    'electronCounter',
    objectSrc = cms.InputTag('slimmedElectrons')
)

jetCounter = cms.EDAnalyzer(
    'jetCounter',
    objectSrc = cms.InputTag('slimmedJets')
)

fatJetCounter = cms.EDAnalyzer(
    'jetCounter',
    objectSrc = cms.InputTag('slimmedJetsAK8')
)

muonCounter = cms.EDAnalyzer(
    'muonCounter',
    objectSrc = cms.InputTag('slimmedMuons')
)

photonCounter = cms.EDAnalyzer(
    'photonCounter',
    objectSrc=cms.InputTag('slimmedPhotons')
)

tauCounter = cms.EDAnalyzer(
    'tauCounter',
    objectSrc = cms.InputTag('slimmedTaus')
)

boostedTauCounter = cms.EDAnalyzer(
    'tauCounter',
    objectSrc = cms.InputTag('slimmedTausBoosted')
)

objectCountSequence = cms.Sequence (
    electronCounter +
    jetCounter +
    fatJetCounter +
    muonCounter +
    photonCounter +
    tauCounter+
    boostedTauCounter
)