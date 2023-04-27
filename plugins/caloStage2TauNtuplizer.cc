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

#include "DataFormats/L1Trigger/interface/Tau.h"
#include "DataFormats/L1Trigger/interface/BXVector.h"

class caloStage2TauNtuplizer : public edm::one::EDAnalyzer<edm::one::SharedResources>
{
    public:
        explicit caloStage2TauNtuplizer(const edm::ParameterSet&);
        ~caloStage2TauNtuplizer() override;

    private:
        void beginJob() override {};
        void analyze(const edm::Event&, const edm::EventSetup&) override;
        void endJob() override {};

        edm::InputTag TauTag;

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

        // Tau specific properties
        std::vector<int> towerIEtaVector;
        std::vector<int> towerIPhiVector;
        std::vector<int> rawEtVector;
        std::vector<int> isoEtVector;
        std::vector<int> nTTVector;
        std::vector<bool> hasEMVector;
        std::vector<bool> isMergedVector;
};

caloStage2TauNtuplizer::caloStage2TauNtuplizer(const edm::ParameterSet& iConfig):
    TauTag(iConfig.getParameter<edm::InputTag>("TauSrc"))
{
    usesResource("TFileService");
    consumes<BXVector<l1t::Tau>>(TauTag);

    outputTree = theFileService->make<TTree>("L1CaloTauInformation", "Tau infomration at the CaloL2 level");
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

    // Tau specific properties
    outputTree->Branch("towerIEtaVector", &towerIEtaVector);
    outputTree->Branch("towerIPhiVector", &towerIPhiVector);
    outputTree->Branch("rawEtVector", &rawEtVector);
    outputTree->Branch("isoEtVector", &isoEtVector);
    outputTree->Branch("nTTVector", &nTTVector);
    outputTree->Branch("hasEMVector", &hasEMVector);
    outputTree->Branch("isMergedVector", &isMergedVector);
}

caloStage2TauNtuplizer::~caloStage2TauNtuplizer()
{}

void caloStage2TauNtuplizer::analyze(const edm::Event& iEvent, const edm::EventSetup& iSetup)
{
    using namespace edm;

    edm::Handle<BXVector<l1t::Tau>> TauHandle;
    iEvent.getByLabel(TauTag, TauHandle);

    for(auto theTau = TauHandle->begin(0); theTau != TauHandle->end(0); theTau++)
    {
        nObjects++;
        ptVector.push_back(theTau->pt());
        etaVector.push_back(theTau->eta());
        phiVector.push_back(theTau->phi());
        massVector.push_back(theTau->mass());
        etVector.push_back(theTau->et());
        chargeVector.push_back(theTau->charge());
        mtVector.push_back(theTau->mt());
        vxVector.push_back(theTau->vx());
        vyVector.push_back(theTau->vy());
        vzVector.push_back(theTau->vz());

        towerIEtaVector.push_back(theTau->towerIEta());
        towerIPhiVector.push_back(theTau->towerIPhi());
        rawEtVector.push_back(theTau->rawEt());
        isoEtVector.push_back(theTau->isoEt());
        nTTVector.push_back(theTau->nTT());
        hasEMVector.push_back(theTau->hasEM());
        isMergedVector.push_back(theTau->isMerged());
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
    hasEMVector.clear();
    isMergedVector.clear();
}

DEFINE_FWK_MODULE(caloStage2TauNtuplizer);