import FWCore.ParameterSet.Config as cms

from anomalyDetection.miniCICADA.chargedHadronPFcandidateAnalyzer_cfi import chargedHadronPFcandidateAnalyzer
from anomalyDetection.miniCICADA.neutralHadronPFcandidateAnalyzer_cfi import neutralHadronPFcandidateAnalyzer
from anomalyDetection.miniCICADA.muonPFcandidateAnalyzer_cfi import muonPFcandidateAnalyzer
from anomalyDetection.miniCICADA.electronPFcandidateAnalyzer_cfi import electronPFcandidateAnalyzer
from anomalyDetection.miniCICADA.gammaPFcandidateAnalyzer_cfi import gammaPFcandidateAnalyzer

PFcandSequence = cms.Sequence(chargedHadronPFcandidateAnalyzer +
                              neutralHadronPFcandidateAnalyzer +
                              muonPFcandidateAnalyzer +
                              electronPFcandidateAnalyzer +
                              gammaPFcandidateAnalyzer)
