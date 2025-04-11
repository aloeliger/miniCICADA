import FWCore.ParameterSet.Config as cms

electronCounter = cms.EDAnalyzer(
    'electronCounter',
    objectSrc = cms.InputTag('slimmedElectrons'),
    object_name = cms.string('electron'),
)

jetCounter = cms.EDAnalyzer(
    'jetCounter',
    objectSrc = cms.InputTag('slimmedJets'),
    object_name = cms.string('jet'),
)

fatJetCounter = cms.EDAnalyzer(
    'jetCounter',
    objectSrc = cms.InputTag('slimmedJetsAK8'),
    object_name = cms.string('fatJet'),
)

muonCounter = cms.EDAnalyzer(
    'muonCounter',
    objectSrc = cms.InputTag('slimmedMuons'),
    object_name = cms.string('muon'),
)

photonCounter = cms.EDAnalyzer(
    'photonCounter',
    objectSrc=cms.InputTag('slimmedPhotons'),
    object_name = cms.string('photon'),
)

tauCounter = cms.EDAnalyzer(
    'tauCounter',
    objectSrc = cms.InputTag('slimmedTaus'),
    object_name = cms.string('tau'),
)

boostedTauCounter = cms.EDAnalyzer(
    'tauCounter',
    objectSrc = cms.InputTag('slimmedTausBoosted'),
    object_name = cms.string('boostedTau'),
)

metCounter = cms.EDAnalyzer(
    'metCounter',
    objectSrc = cms.InputTag('slimmedMETsPuppi'),
    object_name = cms.string('met'),
)

objectCountSequence = cms.Sequence (
    electronCounter +
    jetCounter +
    fatJetCounter +
    muonCounter +
    photonCounter +
    tauCounter +
    boostedTauCounter +
    metCounter
)
