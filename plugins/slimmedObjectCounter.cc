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

#include "DataFormats/PatCandidates/interface/Electron.h"
#include "DataFormats/PatCandidates/interface/Jet.h"
#include "DataFormats/PatCandidates/interface/Muon.h"
#include "DataFormats/PatCandidates/interface/Photon.h"
#include "DataFormats/PatCandidates/interface/Tau.h"
#include "DataFormats/PatCandidates/interface/MET.h"

#include <string>

namespace objectCounter
{
    template <class T>
    class slimmedObjectCounter: public edm::one::EDAnalyzer< edm::one::SharedResources >
    {
        public:
            explicit slimmedObjectCounter(const edm::ParameterSet&);
            ~slimmedObjectCounter() = default;

        protected:
            void beginJob() override {};
            void analyze(const edm::Event&, const edm::EventSetup&) override;
            void endJob() override {};

            edm::InputTag objectSrc;
            std::string object_name;

            edm::Service<TFileService> theFileService;

            TTree* outputTree;
            unsigned int nObjects = 0;
            std::vector<double> ptVector;
            std::vector<double> etaVector;
            std::vector<double> phiVector;
            std::vector<double> massVector;
            std::vector<double> etVector;
            
    };

    template <class T>
    slimmedObjectCounter<T>::slimmedObjectCounter(const edm::ParameterSet& iConfig):
      objectSrc(iConfig.getParameter<edm::InputTag>("objectSrc")),
      object_name(iConfig.getParameter<std::string>("object_name"))
    {
        usesResource("TFileService");
        consumes<std::vector<T>>(objectSrc);

        outputTree = theFileService->make<TTree>("objectInfo", "basic object info");
        outputTree->Branch((object_name+"_nObjects").c_str(), &nObjects);
        outputTree->Branch((object_name+"_ptVector").c_str(), &ptVector);
        outputTree->Branch((object_name+"_etaVector").c_str(), &etaVector);
        outputTree->Branch((object_name+"_phiVector").c_str(), &phiVector);
        outputTree->Branch((object_name+"_massVector").c_str(), &massVector);
        outputTree->Branch((object_name+"_etVector").c_str(), &etVector);
    }

    template <class T>
    void slimmedObjectCounter<T>::analyze(const edm::Event& iEvent, const edm::EventSetup& iSetup)
    {
        edm::Handle<std::vector<T>> objectHandle;
        iEvent.getByLabel(objectSrc, objectHandle);

        nObjects = objectHandle->size();

        for(auto theObject = objectHandle->begin();
            theObject != objectHandle->end();
            theObject++)
        {
            ptVector.push_back(theObject->pt());
            etaVector.push_back(theObject->eta());
            phiVector.push_back(theObject->phi());
            massVector.push_back(theObject->mass());
            etVector.push_back(theObject->et());
        }

        outputTree->Fill();

        nObjects = 0;
        ptVector.clear();
        etaVector.clear();
        phiVector.clear();
        massVector.clear();
        etVector.clear();
    }

  class metCounter : public slimmedObjectCounter<pat::MET>
  {
  public:
    explicit metCounter(const edm::ParameterSet&);
    ~metCounter() = default;

  private:
    void analyze(const edm::Event&, const edm::EventSetup&);
    std::vector<int> metType;
  };

  metCounter::metCounter(const edm::ParameterSet& iConfig):
    slimmedObjectCounter(iConfig)
  {
    outputTree->Branch((object_name+"_metType").c_str(), &metType);
  }

  void metCounter::analyze(const edm::Event& iEvent, const edm::EventSetup& iSetup)
  {
    edm::Handle<std::vector<pat::MET>> objectHandle;
    iEvent.getByLabel(objectSrc, objectHandle);

    for (auto theObject = objectHandle->begin(); theObject != objectHandle->end(); theObject++)
      {
	int type = 0;
	if (theObject->isCaloMET() and not theObject->isPFMET() and not theObject->isRecoMET())
	  type = 1;
	else if(not theObject->isCaloMET() and theObject->isPFMET() and not theObject->isRecoMET())
	  type=2;
	else if(not theObject->isCaloMET() and not theObject->isPFMET() and theObject->isRecoMET())
	  type = 3;
	else if(theObject->isCaloMET() and theObject->isPFMET() and not theObject->isRecoMET())
	  type = 4;
	else if(theObject->isCaloMET() and not theObject->isPFMET() and theObject->isRecoMET())
	  type = 5;
	else if(not theObject->isCaloMET() and theObject->isPFMET() and theObject->isRecoMET())
	  type = 6;
	else if(theObject->isCaloMET() and theObject->isPFMET() and  theObject->isRecoMET())
	  type = 7;

	metType.push_back(type);
      }

    slimmedObjectCounter::analyze(iEvent, iSetup);
    metType.clear();
  }

}

typedef objectCounter::slimmedObjectCounter<pat::Electron> electronCounter;
typedef objectCounter::slimmedObjectCounter<pat::Jet> jetCounter;
typedef objectCounter::slimmedObjectCounter<pat::Muon> muonCounter;
typedef objectCounter::slimmedObjectCounter<pat::Photon> photonCounter;
typedef objectCounter::slimmedObjectCounter<pat::Tau> tauCounter;
typedef objectCounter::metCounter metCounter;

DEFINE_FWK_MODULE(electronCounter);
DEFINE_FWK_MODULE(jetCounter);
DEFINE_FWK_MODULE(muonCounter);
DEFINE_FWK_MODULE(photonCounter);
DEFINE_FWK_MODULE(tauCounter);
DEFINE_FWK_MODULE(metCounter);
