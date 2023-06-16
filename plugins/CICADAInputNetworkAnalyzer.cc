#include <memory>
#include <cmath>

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

class CICADAInputNetworkAnalyzer : public edm::one::EDAnalyzer<edm::one::SharedResources>
{
    public:
        explicit CICADAInputNetworkAnalyzer(const edm::ParameterSet&);
        ~CICADAInputNetworkAnalyzer() override {};
    
    private:
        void analyze(const edm::Event&, const edm::EventSetup&) override;
        void readVectorToArray(const std::vector<float>& theVector, unsigned short int (&theArray)[18][14]);

        edm::InputTag predictionTag;

        unsigned short int regionPrediction[18][14];
        edm::Service<TFileService> theFileService;
        TTree* predictionTree;
};

CICADAInputNetworkAnalyzer::CICADAInputNetworkAnalyzer(const edm::ParameterSet& iConfig):
    predictionTag(iConfig.getParameter<edm::InputTag>("predictionSource"))
{
    usesResource("TFileService");
    consumes<std::vector<float>>(predictionTag);

    predictionTree = theFileService->make<TTree>("CICADAInputNetworkTree", "Tree for containing the CICADAInputNetwork Predictions");
    predictionTree->Branch("CICADAInputNetworkPrediction", &regionPrediction, "regionPrediction[18][14]/s");
}

void CICADAInputNetworkAnalyzer::analyze(const edm::Event& iEvent, const edm::EventSetup& iSetup)
{
    using namespace edm;

    edm::Handle< std::vector<float> >predictionHandle;
    iEvent.getByLabel(predictionTag, predictionHandle);

    readVectorToArray(*predictionHandle, regionPrediction);

    predictionTree->Fill();
}

void CICADAInputNetworkAnalyzer::readVectorToArray(const std::vector<float>& theVector, unsigned short int (&theArray)[18][14])
{
    for(int i = 0; i < 18; ++i)
    {
        for(int j = 0; j < 14; ++j)
        {
            theArray[i][j] = std::floor(theVector.at(i*14+j));
        }
    }
}

DEFINE_FWK_MODULE(CICADAInputNetworkAnalyzer);