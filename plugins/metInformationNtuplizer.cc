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

#include "DataFormats/PatCandidates/interface/MET.h"

class metInformationNtuplizer : public edm::one::EDAnalyzer< edm::one::SharedResources >
{
    public:
        explicit metInformationNtuplizer(const edm::ParameterSet&);
        ~metInformationNtuplizer() override;
    private:
        void beginJob() override {};
        void analyze(const edm::Event&, const edm::EventSetup&) override;
        void endJob() override {};

        edm::EDGetTokenT<std::vector<pat::MET>> metToken;

        edm::Service<TFileService> theFileService;

        TTree* outputTree;

        float METpt;
};

metInformationNtuplizer::metInformationNtuplizer(const edm::ParameterSet& iConfig):
    metToken(consumes<std::vector<pat::MET>>(iConfig.getParameter<edm::InputTag>("metSrc")))
{
    usesResource("TFileService");

    outputTree = theFileService->make<TTree>("metInformation","Met information taken from the slimmed mets");
    outputTree->Branch("METpt", &METpt);
}

metInformationNtuplizer::~metInformationNtuplizer()
{}

void metInformationNtuplizer::analyze(const edm::Event& iEvent, const edm::EventSetup& iSetup)
{
    using namespace edm;

    Handle<std::vector<pat::MET>> metHandle;
    iEvent.getByToken(metToken, metHandle);
/*     std::cout<<"Vector size: "<<metHandle->size()<<std::endl;
    for(const auto& met: *metHandle)
    {
        std::cout<<"Entry:"<<std::endl;
        std::cout<<"\tpt:"<<met.pt()<<std::endl;
        std::cout<<"\teta:"<<met.eta()<<std::endl;
        std::cout<<"\tphi:"<<met.phi()<<std::endl;
    } */
    METpt = metHandle->at(0).pt();

    outputTree->Fill();
}

DEFINE_FWK_MODULE(metInformationNtuplizer);