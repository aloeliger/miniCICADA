#include "FWCore/Framework/interface/Frameworkfwd.h"
#include "FWCore/Framework/interface/stream/EDProducer.h"

#include "FWCore/Framework/interface/Event.h"
#include "FWCore/Framework/interface/MakerMacros.h"

#include "FWCore/ParameterSet/interface/ParameterSet.h"

#include <memory>
#include <string>

#include "PhysicsTools/TensorFlow/interface/TensorFlow.h"

#include "DataFormats/L1Trigger/interface/BXVector.h"
#include "DataFormats/L1Trigger/interface/EGamma.h"
#include "DataFormats/L1Trigger/interface/EtSum.h"
#include "DataFormats/L1Trigger/interface/Jet.h"
#include "DataFormats/L1Trigger/interface/Tau.h"

#include "DataFormats/PatCandidates/interface/MET.h"

#include "DataFormats/VertexReco/interface/Vertex.h"

#include "DataFormats/PatCandidates/interface/Electron.h"
#include "DataFormats/PatCandidates/interface/Jet.h"
#include "DataFormats/PatCandidates/interface/Muon.h"
#include "DataFormats/PatCandidates/interface/Photon.h"
#include "DataFormats/PatCandidates/interface/Tau.h"

using namespace std;

class miniCICADAProducer: public edm::stream::EDProducer<>{
    public:
        explicit miniCICADAProducer(const edm::ParameterSet&);
        ~miniCICADAProducer() override;

        static void fillDescriptions(edm::ConfigurationDescriptions& descriptions);

    private:
        void produce(edm::Event&, const edm::EventSetup&) override;

        template<typename T>
        std::vector<T> getNLeadingObjects(int nObj, const BXVector<T>& theVector);
        template<typename T>
        std::vector<float> turnParticleVectorsIntoInputVector(int nObjs, const std::vector<T>& theVector);
        std::vector<float> turnEtSumVectorsIntoInputVector(const std::vector<l1t::EtSum>& theVector);

        edm::EDGetTokenT<std::vector<reco::Vertex>> vertexToken;
        edm::EDGetTokenT<std::vector<pat::MET>> metToken;
        edm::InputTag EGammaTag;
        edm::InputTag JetTag;
        edm::InputTag TauTag;
        edm::InputTag EtTag;
        edm::InputTag slimmedElectronTag;
        edm::InputTag slimmedJetTag;
        edm::InputTag slimmedFatJetTag;
        edm::InputTag slimmedPhotonTag;
        edm::InputTag slimmedTauTag;
        edm::InputTag slimmedBoostedTauTag;

        tensorflow::Options options;
        tensorflow::MetaGraphDef* metaGraph;
        tensorflow::Session* session;

        std::string outputLabel;
};

miniCICADAProducer::miniCICADAProducer(const edm::ParameterSet& iConfig):
    vertexToken(consumes<std::vector<reco::Vertex>>(iConfig.getParameter<edm::InputTag>("pvSrc"))),
    metToken(consumes<std::vector<pat::MET>>(iConfig.getParameter<edm::InputTag>("metSrc"))),
    EGammaTag(iConfig.getParameter<edm::InputTag>("EGammaSrc")),
    JetTag(iConfig.getParameter<edm::InputTag>("JetSrc")),
    TauTag(iConfig.getParameter<edm::InputTag>("TauSrc")),
    EtTag(iConfig.getParameter<edm::InputTag>("EtSrc")),
    slimmedElectronTag(iConfig.getParameter<edm::InputTag>("slimmedElectronSrc")),
    slimmedJetTag(iConfig.getParameter<edm::InputTag>("slimmedJetSrc")),
    slimmedFatJetTag(iConfig.getParameter<edm::InputTag>("slimmedFatJetSrc")),
    slimmedPhotonTag(iConfig.getParameter<edm::InputTag>("slimmedPhotonSrc")),
    slimmedTauTag(iConfig.getParameter<edm::InputTag>("slimmedTauSrc")),
    slimmedBoostedTauTag(iConfig.getParameter<edm::InputTag>("slimmedBoostedTauSrc")),
    outputLabel(iConfig.getParameter<string>("outputLabel"))
{
    consumes<BXVector<l1t::EGamma>>(EGammaTag);
    consumes<BXVector<l1t::Jet>>(JetTag);
    consumes<BXVector<l1t::Tau>>(TauTag);
    consumes<BXVector<l1t::EtSum>>(EtTag);
    
    consumes<std::vector<pat::Electron>>(slimmedElectronTag);
    consumes<std::vector<pat::Jet>>(slimmedJetTag);
    consumes<std::vector<pat::Jet>>(slimmedFatJetTag);
    consumes<std::vector<pat::Photon>>(slimmedPhotonTag);
    consumes<std::vector<pat::Tau>>(slimmedTauTag);
    consumes<std::vector<pat::Tau>>(slimmedBoostedTauTag);
    

    std::string pathToModel(std::getenv("CMSSW_BASE"));
    pathToModel.append(iConfig.getParameter<string>("miniCICADAModelLocation"));
    produces<float>(outputLabel);

    metaGraph = tensorflow::loadMetaGraphDef(pathToModel);
    session = tensorflow::createSession(metaGraph, pathToModel, options);
}

miniCICADAProducer::~miniCICADAProducer()
{
    tensorflow::closeSession(session);
    session = nullptr;
    delete metaGraph;
    metaGraph = nullptr;
}

void miniCICADAProducer::produce(edm::Event& iEvent, const edm::EventSetup& iSetup)
{
    std::unique_ptr<float> miniCICADAScore = std::make_unique<float>();

    edm::Handle<std::vector<reco::Vertex>> vertexVector;
    edm::Handle<std::vector<pat::MET>> metVector;
    
    edm::Handle<BXVector<l1t::EGamma>> EGammaVector;
    edm::Handle<BXVector<l1t::Jet>> JetVector;
    edm::Handle<BXVector<l1t::Tau>> TauVector;
    edm::Handle<BXVector<l1t::EtSum>> EtSumVector;
    
    edm::Handle<std::vector<pat::Electron>> slimmedElectronVector;
    edm::Handle<std::vector<pat::Jet>> slimmedJetVector;
    edm::Handle<std::vector<pat::Jet>> slimmedFatJetVector;
    edm::Handle<std::vector<pat::Photon>> slimmedPhotonVector;
    edm::Handle<std::vector<pat::Tau>> slimmedTauVector;
    edm::Handle<std::vector<pat::Tau>> slimmedBoostedTauVector;

    iEvent.getByToken(vertexToken, vertexVector);
    iEvent.getByToken(metToken, metVector);
    iEvent.getByLabel(EGammaTag, EGammaVector);
    iEvent.getByLabel(JetTag, JetVector);
    iEvent.getByLabel(TauTag, TauVector);
    iEvent.getByLabel(EtTag, EtSumVector);
    
    iEvent.getByLabel(slimmedElectronTag, slimmedElectronVector);
    iEvent.getByLabel(slimmedJetTag, slimmedJetVector);
    iEvent.getByLabel(slimmedFatJetTag, slimmedFatJetVector);
    iEvent.getByLabel(slimmedPhotonTag, slimmedPhotonVector);
    iEvent.getByLabel(slimmedTauTag, slimmedTauVector);
    iEvent.getByLabel(slimmedBoostedTauTag, slimmedBoostedTauVector);

    tensorflow::Tensor modelInput(tensorflow::DT_FLOAT, {1, 195});

    // Add PU and MET
    modelInput.tensor<float, 2>()(0, 0) = (float)vertexVector->size();
    modelInput.tensor<float, 2>()(0, 1) = metVector->at(0).pt();

    // Keep track of where we are in the tensor
    int tensorIndex = 2;
    
    // EGamma input
    modelInput.tensor<float, 2>()(0, 2) = (float)EGammaVector->size();
    tensorIndex++;
    auto EGammaInputVector = turnParticleVectorsIntoInputVector(4, getNLeadingObjects(4, *EGammaVector));
    for (int i = tensorIndex; i < tensorIndex + 4*5; ++i)
        modelInput.tensor<float, 2>()(0, i) = EGammaInputVector.at(i-tensorIndex);
    tensorIndex += 4*5;

    // Jet input
    modelInput.tensor<float, 2>()(0, tensorIndex) = (float)JetVector->size();
    tensorIndex++;
    auto JetInputVector = turnParticleVectorsIntoInputVector(4, getNLeadingObjects(4, *JetVector));
    for (int i = tensorIndex; i < tensorIndex + 4*5; ++i)
        modelInput.tensor<float, 2>()(0, i) = JetInputVector.at(i-tensorIndex);
    tensorIndex += 4*5;

    // Tau input
    modelInput.tensor<float, 2>()(0, tensorIndex) = (float)TauVector->size();
    tensorIndex++;
    auto TauInputVector = turnParticleVectorsIntoInputVector(4, getNLeadingObjects(4, *TauVector));
    for (int i = tensorIndex; i < tensorIndex + 4*5; ++i)
        modelInput.tensor<float, 2>()(0, i) = TauInputVector.at(i-tensorIndex);
    tensorIndex += 4*5;

    // Et Sum Input
    auto EtSumInputVector = turnEtSumVectorsIntoInputVector(getNLeadingObjects(4, *EtSumVector));
    for (int i=tensorIndex; i < tensorIndex + 4*31; ++i)
        modelInput.tensor<float, 2>()(0, i) = EtSumInputVector.at(i-tensorIndex);
    tensorIndex += 4*31;

    //remaining count information
    modelInput.tensor<float, 2>()(0, tensorIndex) = (float)slimmedElectronVector->size();
    modelInput.tensor<float, 2>()(0, tensorIndex) = (float)slimmedJetVector->size();
    modelInput.tensor<float, 2>()(0, tensorIndex) = (float)slimmedFatJetVector->size();
    modelInput.tensor<float, 2>()(0, tensorIndex) = (float)slimmedPhotonVector->size();
    modelInput.tensor<float, 2>()(0, tensorIndex) = (float)slimmedTauVector->size();
    modelInput.tensor<float, 2>()(0, tensorIndex) = (float)slimmedBoostedTauVector->size();

    std::vector<tensorflow::Tensor> modelOutput;
    tensorflow::run(session, {{"serving_default_input_1:0", modelInput}},{"StatefulPartitionedCall:0"}, &modelOutput);
    *miniCICADAScore = modelOutput[0].matrix<float>()(0,0);


    iEvent.put(std::move(miniCICADAScore), outputLabel);
}

template<typename T>
std::vector<T> miniCICADAProducer::getNLeadingObjects(int nObj, const BXVector<T>& theVector)
{
    std::vector<T> resVector;
    for(auto particle = theVector.begin(0); particle != theVector.end(0); ++particle)
    {
        auto it = resVector.begin();
        for (; it != resVector.end(); ++it)
        {
            //If we're higher pt, then keep going, otherwise, we're in the right spot
            if (it->pt() > particle->pt())
                continue;
            else
                break;
        }
        //at this point, this should be the right index to insert the new pt at
        resVector.insert(it, *particle);
        if ((int)resVector.size() > nObj)
            resVector.pop_back();
    }
    return resVector;
}

//fill a vector we can simply read back out into the input tensor
template<typename T>
std::vector<float> miniCICADAProducer::turnParticleVectorsIntoInputVector(int nObj, const std::vector<T>& theVector)
{
    std::vector<float> resVector;
    int fullObjects = 0;
    for (const auto& particle: theVector)
    {
        resVector.push_back(particle.pt());
        resVector.push_back(particle.eta());
        resVector.push_back(particle.phi());
        resVector.push_back(particle.mt());
        resVector.push_back(particle.et());
        fullObjects++;
    }
    //If we didn't have a full set of particles, fill with empty stuff
    for (int i = 0; i < nObj - fullObjects; ++i)
    {
        resVector.push_back(0.0);
        resVector.push_back(0.0);
        resVector.push_back(0.0);
        resVector.push_back(0.0);
        resVector.push_back(0.0);
    }

    return resVector;
}

std::vector<float> miniCICADAProducer::turnEtSumVectorsIntoInputVector(const std::vector<l1t::EtSum>& theVector)
{
    std::vector<float> resVector;
    for (const auto& sum: theVector)
    {
        resVector.push_back(sum.pt());
        resVector.push_back(sum.mt());
        resVector.push_back(sum.et());
        for (int i =0; i < 28; i++)
        {
            if (i == (int)sum.getType())
                resVector.push_back(1.0);
            else
                resVector.push_back(0.0);
        }
    }
    return resVector;
}

void miniCICADAProducer::fillDescriptions(edm::ConfigurationDescriptions& descriptions)
{
    edm::ParameterSetDescription desc;
    desc.add<string>("miniCICADAModelLocation", "/src/anomalyDetection/miniCICADA/models/miniCICADA_v1p0/miniCICADAModel/");
    desc.add<edm::InputTag>("pvSrc", edm::InputTag("offlineSlimmedPrimaryVertices"));
    desc.add<edm::InputTag>("metSrc", edm::InputTag("slimmedMETs"));
    desc.add<edm::InputTag>("EGammaSrc", edm::InputTag("caloStage2Digis","EGamma"));
    desc.add<edm::InputTag>("JetSrc", edm::InputTag("caloStage2Digis","Jet"));
    desc.add<edm::InputTag>("TauSrc", edm::InputTag("caloStage2Digis","Tau"));
    desc.add<edm::InputTag>("EtSrc", edm::InputTag("caloStage2Digis","EtSum"));
    desc.add<edm::InputTag>("slimmedElectronSrc", edm::InputTag("slimmedElectrons"));
    desc.add<edm::InputTag>("slimmedJetSrc", edm::InputTag("slimmedJets"));
    desc.add<edm::InputTag>("slimmedFatJetSrc", edm::InputTag("slimmedJetsAK8"));
    desc.add<edm::InputTag>("slimmedPhotonSrc", edm::InputTag("slimmedPhotons"));
    desc.add<edm::InputTag>("slimmedTauSrc", edm::InputTag("slimmedTaus"));
    desc.add<edm::InputTag>("slimmedBoostedTauSrc", edm::InputTag("slimmedTausBoosted"));
    desc.add<string>("outputLabel", "miniCICADAScore");
    descriptions.addDefault(desc);
}

DEFINE_FWK_MODULE(miniCICADAProducer);