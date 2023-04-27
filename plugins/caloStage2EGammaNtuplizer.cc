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

#include "DataFormats/L1Trigger/interface/EGamma.h"
#include "DataFormats/L1Trigger/interface/BXVector.h"

class caloStage2EGammaNtuplizer : public edm::one::EDAnalyzer< edm::one::SharedResources >
{
    public:
        explicit caloStage2EGammaNtuplizer(const edm::ParameterSet&);
        ~caloStage2EGammaNtuplizer() override;

    private:
        void beginJob() override {};
        void analyze(const edm::Event&, const edm::EventSetup&) override;
        void endJob() override {};

        //edm::EDGetTokenT<BXVector<l1t::EGamma>> EGammaToken;
        edm::InputTag EGammaTag;

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

        //EGamma specific properties
        std::vector<int> towerIEtaVector;
        std::vector<int> towerIPhiVector;
        std::vector<int> rawEtVector;
        std::vector<int> isoEtVector;
        std::vector<int> nTTVector;
        std::vector<int> shapeVector;
        std::vector<int> towerHoverEVector;
        
};

caloStage2EGammaNtuplizer::caloStage2EGammaNtuplizer(const edm::ParameterSet& iConfig):
    //EGammaToken(consumes<BXVector<l1t::EGamma>>(iConfig.getParameter<edm::InputTag>("EGammaSrc")))
    EGammaTag(iConfig.getParameter<edm::InputTag>("EGammaSrc"))
{
    usesResource("TFileService");
    consumes<BXVector<l1t::EGamma>>(EGammaTag);

    outputTree = theFileService->make<TTree>("L1CaloEgammaInformation","EGamma information at the CaloL2 level");    
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

    //eGamma specific properties
    outputTree->Branch("towerIEtaVector", &towerIEtaVector);
    outputTree->Branch("towerIPhiVector", &towerIPhiVector);
    outputTree->Branch("rawEtVector", &rawEtVector);
    outputTree->Branch("isoEtVector", &isoEtVector);
    outputTree->Branch("nTTVector", &nTTVector);
    outputTree->Branch("shapeVector", &shapeVector);
    outputTree->Branch("towerHoverEVector", &towerHoverEVector);
}

caloStage2EGammaNtuplizer::~caloStage2EGammaNtuplizer()
{}

void caloStage2EGammaNtuplizer::analyze(const edm::Event& iEvent, const edm::EventSetup& iSetup)
{
    using namespace edm;

    edm::Handle<BXVector<l1t::EGamma>> EGammaHandle;
    iEvent.getByLabel(EGammaTag, EGammaHandle);

    for (auto theEGamma = EGammaHandle->begin(0); theEGamma != EGammaHandle->end(0); theEGamma++)
    {
        nObjects++;
        ptVector.push_back(theEGamma->pt());
        etaVector.push_back(theEGamma->eta());
        phiVector.push_back(theEGamma->phi());
        massVector.push_back(theEGamma->mass());
        etVector.push_back(theEGamma->et());
        chargeVector.push_back(theEGamma->charge());
        mtVector.push_back(theEGamma->mt());
        vxVector.push_back(theEGamma->vx());
        vyVector.push_back(theEGamma->vy());
        vzVector.push_back(theEGamma->vz());

        towerIEtaVector.push_back(theEGamma->towerIEta());
        towerIPhiVector.push_back(theEGamma->towerIPhi());
        rawEtVector.push_back(theEGamma->rawEt());
        isoEtVector.push_back(theEGamma->isoEt());
        nTTVector.push_back(theEGamma->nTT());
        shapeVector.push_back(theEGamma->shape());
        towerHoverEVector.push_back(theEGamma->towerHoE());
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

    towerIEtaVector.clear();
    towerIPhiVector.clear();
    rawEtVector.clear();
    isoEtVector.clear();
    nTTVector.clear();
    shapeVector.clear();
    towerHoverEVector.clear();
}

DEFINE_FWK_MODULE(caloStage2EGammaNtuplizer);