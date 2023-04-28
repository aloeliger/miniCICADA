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

#include "DataFormats/L1Trigger/interface/EtSum.h"
#include "DataFormats/L1Trigger/interface/BXVector.h"

class caloStage2EtSumNtuplizer : public edm::one::EDAnalyzer< edm::one::SharedResources >
{
    public:
        explicit caloStage2EtSumNtuplizer(const edm::ParameterSet&);
        ~caloStage2EtSumNtuplizer() override;
    private:
        void beginJob() override {};
        void analyze(const edm::Event&, const edm::EventSetup&) override;
        void endJob() override {};

        edm::InputTag EtSumTag;

        edm::Service<TFileService> theFileService;

        TTree* outputTree;
        unsigned int nObjects = 0;
        std::vector<double> ptVector;
        std::vector<double> etaVector;
        std::vector<double> phiVector;
        std::vector<double> massVector;
        std::vector<double> etVector;
        std::vector<int> chargeVector;
        std::vector<double> mtVector;
        std::vector<double> vxVector;
        std::vector<double> vyVector;
        std::vector<double> vzVector;

        // EtSum specific properties
        std::vector<int> typeVector;
};

caloStage2EtSumNtuplizer::caloStage2EtSumNtuplizer(const edm::ParameterSet& iConfig):
    EtSumTag(iConfig.getParameter<edm::InputTag>("EtSumSrc"))
{
    usesResource("TFileService");
    consumes<BXVector<l1t::EtSum>>(EtSumTag);

    outputTree = theFileService->make<TTree>("L1CaloEtSumInformation","EGamma information at the CaloL2 level");    
    outputTree->Branch("nObjects", &nObjects);
    outputTree->Branch("ptVector", &ptVector);
    outputTree->Branch("etaVector", &etaVector);
    outputTree->Branch("phiVector", &phiVector);
    outputTree->Branch("massVector", &massVector);
    outputTree->Branch("etVector", &etVector);
    outputTree->Branch("chargeVector", &chargeVector);
    outputTree->Branch("mtVector", &mtVector);
    outputTree->Branch("vxVector", &vxVector);
    outputTree->Branch("vyVector", &vyVector);
    outputTree->Branch("vzVector", &vzVector);

    outputTree->Branch("typeVector", &typeVector);
}

caloStage2EtSumNtuplizer::~caloStage2EtSumNtuplizer()
{}

void caloStage2EtSumNtuplizer::analyze(const edm::Event& iEvent, const edm::EventSetup& iSetup)
{
    using namespace edm;

    edm::Handle<BXVector<l1t::EtSum>> EtSumHandle;
    iEvent.getByLabel(EtSumTag, EtSumHandle);

    for (auto theEtSum = EtSumHandle->begin(0); theEtSum != EtSumHandle->end(0); theEtSum++)
    {
        nObjects++;
        ptVector.push_back(theEtSum->pt());
        etaVector.push_back(theEtSum->eta());
        phiVector.push_back(theEtSum->phi());
        massVector.push_back(theEtSum->mass());
        etVector.push_back(theEtSum->et());
        chargeVector.push_back(theEtSum->charge());
        mtVector.push_back(theEtSum->mt());
        vxVector.push_back(theEtSum->vx());
        vyVector.push_back(theEtSum->vy());
        vzVector.push_back(theEtSum->vz());

        typeVector.push_back(theEtSum->getType());
    }
    outputTree->Fill();

    nObjects = 0;
    ptVector.clear();
    etaVector.clear();
    phiVector.clear();
    massVector.clear();
    etVector.clear();
    chargeVector.clear();
    mtVector.clear();
    vxVector.clear();
    vyVector.clear();
    vzVector.clear();

    typeVector.clear();    
}

DEFINE_FWK_MODULE(caloStage2EtSumNtuplizer);