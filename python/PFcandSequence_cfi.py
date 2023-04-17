import FWCore.ParameterSet.Config as cms

from L1Trigger.miniCICADA.chargedHadronPFcandidateAnalyzer_cfi import chargedHadronPFcandidateAnalyzer
from L1Trigger.miniCICADA.neutralHadronPFcandidateAnalyzer_cfi import neutralHadronPFcandidateAnalyzer
from L1Trigger.miniCICADA.muonPFcandidateAnalyzer_cfi import muonPFcandidateAnalyzer
from L1Trigger.miniCICADA.electronPFcandidateAnalyzer_cfi import electronPFcandidateAnalyzer
from L1Trigger.miniCICADA.gammaPFcandidateAnalyzer_cfi import gammaPFcandidateAnalyzer

PFcandSequence = cms.Sequence(chargedHadronPFcandidateAnalyzer +
                              neutralHadronPFcandidateAnalyzer +
                              muonPFcandidateAnalyzer +
                              electronPFcandidateAnalyzer +
                              gammaPFcandidateAnalyzer)
