#include <memory>
#include <iostream>

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

#include <string>

class miniCICADAAnalyzer : public edm::one::EDAnalyzer<edm::one::SharedResources>
{
    public:
        explicit miniCICADAAnalyzer(const edm::ParameterSet&);
        ~miniCICADAAnalyzer() override {};

    private:
        void analyze(const edm::Event&, const edm::EventSetup&) override;

        edm::InputTag scoreTag;

        float miniCICADAScore;
        edm::Service<TFileService> theFileService;
        TTree* scoreTree;
};

miniCICADAAnalyzer::miniCICADAAnalyzer(const edm::ParameterSet& iConfig):
    scoreTag(iConfig.getParameter<edm::InputTag>("scoreSource"))
{
    usesResource("TFileService");
    consumes<float>(scoreTag);
    
    scoreTree = theFileService->make<TTree>("miniCICADAScoreTree", "Tree for containing the miniCICADAScore");
    scoreTree->Branch("miniCICADAScore", &miniCICADAScore);
}

void miniCICADAAnalyzer::analyze(const edm::Event& iEvent, const edm::EventSetup& iSetup)
{
    using namespace edm;

    Handle<float> scoreHandle;
    iEvent.getByLabel(scoreTag, scoreHandle);

    miniCICADAScore = *scoreHandle;

    scoreTree->Fill();
}

DEFINE_FWK_MODULE(miniCICADAAnalyzer);