// system include files
#include <memory>
#include <iostream>

// user include files
#include "FWCore/Framework/interface/Frameworkfwd.h"
#include "FWCore/Framework/interface/one/EDAnalyzer.h"
#include "FWCore/Framework/interface/Event.h"
#include "FWCore/Framework/interface/EventSetup.h"
#include "FWCore/Framework/interface/MakerMacros.h"
#include "FWCore/ParameterSet/interface/ParameterSet.h"
#include "FWCore/Utilities/interface/InputTag.h"
#include "FWCore/ServiceRegistry/interface/Service.h"

#include "CommonTools/UtilAlgos/interface/TFileService.h"

#include "TTree.h"
#include "TLorentzVector.h"

#include "DataFormats/PatCandidates/interface/Jet.h"
#include "DataFormats/PatCandidates/interface/Muon.h"

#include <string>

namespace objectCounter
{
  class HT_Calculator: public edm::one::EDAnalyzer< edm::one::SharedResources >
  {
  public:
    explicit HT_Calculator(const edm::ParameterSet&);
    ~HT_Calculator() = default;

  private:
    void beginJob() override {};
    void analyze(const edm::Event&, const edm::EventSetup&) override;
    void endJob() override {};

    edm::Service<TFileService> theFileService;
    
    edm::InputTag jetSrc;
    edm::InputTag muonSrc;
    TTree* outputTree;
    double HTValue;
  };

  HT_Calculator::HT_Calculator(const edm::ParameterSet& iConfig):
    jetSrc(iConfig.getParameter<edm::InputTag>("jetSrc")),
    muonSrc(iConfig.getParameter<edm::InputTag>("muonSrc"))
  {
    usesResource("TFileService");
    consumes<std::vector<pat::Jet>>(jetSrc);
    consumes<std::vector<pat::Muon>>(muonSrc);

    outputTree = theFileService->make<TTree>("HT_Calculation", "a simple reco object HT Calculation");
    outputTree->Branch("Reco_HT", &HTValue);
  }

  void HT_Calculator::analyze(const edm::Event& iEvent, const edm::EventSetup& iSetup)
  {
    edm::Handle<std::vector<pat::Jet>> jetHandle;
    edm::Handle<std::vector<pat::Muon>> muonHandle;

    iEvent.getByLabel(jetSrc, jetHandle);
    iEvent.getByLabel(muonSrc, muonHandle);

    HTValue = 0.d;
    for(auto theJet = jetHandle->begin(); theJet != jetHandle->end(); theJet++)
      {
	//construct the jet 4 vector;
	TLorentzVector jet_vector = TLorentzVector();
	jet_vector.SetPtEtaPhiM(
				theJet->pt(),
				theJet->eta(),
				theJet->phi(),
				theJet->mass()
				);
	//Check to make sure the current jet vector meets our requirements
	if(!(jet_vector.Pt() > 30.0 and std::abs(jet_vector.Eta() < 3.0)))
	  continue;
	//check it against muons to make sure it is decently separated
	bool is_proximal_to_muon = false;
	for(auto theMuon = muonHandle->begin(); theMuon != muonHandle->end(); theMuon++)
	  {
	    TLorentzVector muon_vector = TLorentzVector(
							theMuon->pt(),
							theMuon->eta(),
							theMuon->phi(),
							theMuon->mass()
							);
	    
	    if(jet_vector.DeltaR(muon_vector) < 0.4)
	      {
		is_proximal_to_muon = true;
		break;
	      }
	  }
	if(is_proximal_to_muon)
	  continue;
	HTValue += jet_vector.Pt();
      }
    outputTree->Fill();
  }
}

typedef objectCounter::HT_Calculator HT_Calculator;
DEFINE_FWK_MODULE(HT_Calculator);
