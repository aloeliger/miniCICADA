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

#include "DataFormats/VertexReco/interface/Vertex.h"

#include "TTree.h"

class pileupInformationNtuplizer : public edm::one::EDAnalyzer< edm::one::SharedResources >
{
    public:
        explicit pileupInformationNtuplizer(const edm::ParameterSet&);
        ~pileupInformationNtuplizer() override;
    private:
        void beginJob() override {};
        void analyze(const edm::Event&, const edm::EventSetup&) override;
        void endJob() override {};

        edm::EDGetTokenT<std::vector<reco::Vertex>> vertexToken;

        edm::Service<TFileService> theFileService;
        TTree* outputTree;
 
        int npv = 0;
};

pileupInformationNtuplizer::pileupInformationNtuplizer(const edm::ParameterSet& iConfig):
    vertexToken(consumes<std::vector<reco::Vertex>>(iConfig.getParameter<edm::InputTag>("pvSrc")))
{
    usesResource("TFileService");

    outputTree = theFileService->make<TTree>("pileupInformation","Pileup information taken from the primary vertices");
    outputTree->Branch("npv", &npv);
}

pileupInformationNtuplizer::~pileupInformationNtuplizer()
{}

void pileupInformationNtuplizer::analyze(const edm::Event& iEvent, const edm::EventSetup& iSetup)
{
    using namespace edm;

    Handle<std::vector<reco::Vertex>> vertexHandle;
    iEvent.getByToken(vertexToken, vertexHandle);
    npv = vertexHandle->size();

    outputTree->Fill();
}

DEFINE_FWK_MODULE(pileupInformationNtuplizer);