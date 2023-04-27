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

#include "DataFormats/L1Trigger/interface/Jet.h"
#include "DataFormats/L1Trigger/interface/BXVector.h"

class caloStage2JetNtuplizer : public edm::one::EDAnalyzer<edm::one::SharedResources>
{
    public:
        explicit caloStage2JetNtuplizer(const edm::ParameterSet&);
        ~caloStage2JetNtuplizer() override;
    
    private:
        void beginJob() override {};
        void analyze(const edm::Event&, const edm::EventSetup&) override;
        void endJob() override {};

        edm::InputTag JetTag;

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

        //Jet Specific properties
        std::vector<int> towerIEtaVector;
        std::vector<int> towerIPhiVector;
        std::vector<int> rawEtVector;
        std::vector<int> seedEtVector;
        std::vector<int> puEtVector;
        //std::vector<int> puDonutEtVector; //There are technically 4 of these?
};

caloStage2JetNtuplizer::caloStage2JetNtuplizer(const edm::ParameterSet& iConfig):
    JetTag(iConfig.getParameter<edm::InputTag>("JetSrc"))
{
    usesResource("TFileService");
    consumes<BXVector<l1t::Jet>>(JetTag);

    outputTree = theFileService->make<TTree>("L1CaloJetInformation","Jet infomration at the CaloL2 level");
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

    //Jet specific properties
    outputTree->Branch("towerIEtaVector", &towerIEtaVector);
    outputTree->Branch("towerIPhiVector", &towerIPhiVector);
    outputTree->Branch("rawEtVector", &rawEtVector);
    outputTree->Branch("seedEtVector", &seedEtVector);
    outputTree->Branch("puEtVector", &puEtVector);
    // outputTree->Branch("puDonutEtVector", &puDonutEtVector);
}

caloStage2JetNtuplizer::~caloStage2JetNtuplizer()
{}

void caloStage2JetNtuplizer::analyze(const edm::Event& iEvent, const edm::EventSetup& iSetup)
{
    using namespace edm;

    edm::Handle<BXVector<l1t::Jet>> JetHandle;
    iEvent.getByLabel(JetTag, JetHandle);

    for (auto theJet = JetHandle->begin(0); theJet != JetHandle->end(0); theJet++)
    {
        nObjects++;
        ptVector.push_back(theJet->pt());
        etaVector.push_back(theJet->eta());
        phiVector.push_back(theJet->phi());
        massVector.push_back(theJet->mass());
        etVector.push_back(theJet->et());
        chargeVector.push_back(theJet->charge());
        mtVector.push_back(theJet->mt());
        vxVector.push_back(theJet->vx());
        vyVector.push_back(theJet->vy());
        vzVector.push_back(theJet->vz());

        towerIEtaVector.push_back(theJet->towerIEta());
        towerIPhiVector.push_back(theJet->towerIPhi());
        rawEtVector.push_back(theJet->rawEt());
        seedEtVector.push_back(theJet->seedEt());
        puEtVector.push_back(theJet->puEt());
        // puDonutEtVector.push_back(theJet->puDonutEt());
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
    seedEtVector.clear();
    puEtVector.clear();
    // puDonutEtVector.clear();    
}

DEFINE_FWK_MODULE(caloStage2JetNtuplizer);