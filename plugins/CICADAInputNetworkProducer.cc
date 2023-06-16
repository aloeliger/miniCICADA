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

using namespace std;

class CICADAInputNetworkProducer: public edm::stream::EDProducer<>{
    public:
        explicit CICADAInputNetworkProducer(const edm::ParameterSet&);
        ~CICADAInputNetworkProducer() override;

        static void fillDescriptions(edm::ConfigurationDescriptions& descriptions);
    private:     
        void produce(edm::Event&, const edm::EventSetup&) override;

        template<typename T>
        std::vector<T> getNLeadingObjects(int nObj, const BXVector<T>& theVector);
        template<typename T>
        std::vector<float> turnParticleVectorsIntoInputVector(int nObjs, const std::vector<T>& theVector);
        std::vector<float> turnEtSumVectorsIntoInputVector(const std::vector<l1t::EtSum>& theVector);
        void insertFeatureVectorIntoTensor(const int startIndex, const std::vector<float>& theFeatures, tensorflow::Tensor& theTensor);

        edm::InputTag EGammaTag;
        edm::InputTag JetTag;
        edm::InputTag TauTag;
        edm::InputTag EtTag;

        tensorflow::Options options;
        tensorflow::MetaGraphDef* metaGraph;
        tensorflow::Session* session;
};

CICADAInputNetworkProducer::CICADAInputNetworkProducer(const edm::ParameterSet& iConfig):
    EGammaTag(iConfig.getParameter<edm::InputTag>("EGammaSrc")),
    JetTag(iConfig.getParameter<edm::InputTag>("JetSrc")),
    TauTag(iConfig.getParameter<edm::InputTag>("TauSrc")),
    EtTag(iConfig.getParameter<edm::InputTag>("EtSrc"))
{
    consumes<BXVector<l1t::EGamma>>(EGammaTag);
    consumes<BXVector<l1t::Jet>>(JetTag);
    consumes<BXVector<l1t::Tau>>(TauTag);
    consumes<BXVector<l1t::EtSum>>(EtTag);

    std::string pathToModel(std::getenv("CMSSW_BASE"));
    pathToModel.append(iConfig.getParameter<string>("CICADAInputNetworkLocation"));
    produces< std::vector<  float > >("regionPrediction");

    metaGraph = tensorflow::loadMetaGraphDef(pathToModel);
    session = tensorflow::createSession(metaGraph, pathToModel, options);
}

CICADAInputNetworkProducer::~CICADAInputNetworkProducer()
{
    tensorflow::closeSession(session);
    session = nullptr;
    delete metaGraph;
    metaGraph = nullptr;
}

void CICADAInputNetworkProducer::produce(edm::Event& iEvent, const edm::EventSetup& iSetup)
{
    std::unique_ptr< std::vector< float > > regionPrediction = std::make_unique< std::vector<float> >();

    edm::Handle<BXVector<l1t::EGamma>> EGammaVector;
    edm::Handle<BXVector<l1t::Jet>> JetVector;
    edm::Handle<BXVector<l1t::Tau>> TauVector;
    edm::Handle<BXVector<l1t::EtSum>> EtSumVector;

    iEvent.getByLabel(EGammaTag, EGammaVector);
    iEvent.getByLabel(JetTag, JetVector);
    iEvent.getByLabel(TauTag, TauVector);
    iEvent.getByLabel(EtTag, EtSumVector);

    tensorflow::Tensor modelInput(tensorflow::DT_FLOAT, {1, 552});

    auto EGammaInputVector = turnParticleVectorsIntoInputVector(12, getNLeadingObjects(12, *EGammaVector));
    // vector starts at 0, is length 60, last index is 59, next index is 60
    insertFeatureVectorIntoTensor(0, EGammaInputVector, modelInput);


    auto jetInputVector = turnParticleVectorsIntoInputVector(12, getNLeadingObjects(12, *JetVector));
    // vector starts at 60, and is length 60, last index is 119, next index is 120
    insertFeatureVectorIntoTensor(60, jetInputVector, modelInput);

    auto tauInputVector = turnParticleVectorsIntoInputVector(12, getNLeadingObjects(12, *TauVector));
    // vector starts at 120, and is length 60, last index is 179 next index is 180
    insertFeatureVectorIntoTensor(120, tauInputVector, modelInput);

    auto ETSumInputVector = turnEtSumVectorsIntoInputVector(getNLeadingObjects(12, *EtSumVector));
    //vector starts at 180, and should fill out the rest all the way to 552
    insertFeatureVectorIntoTensor(180, ETSumInputVector, modelInput);

    std::vector<tensorflow::Tensor> modelOutput;
    tensorflow::run(session, {{"serving_default_input_1:0", modelInput}},{"StatefulPartitionedCall:0"}, &modelOutput);

    for(int i = 0; i < 18; i++)
    {
        for(int j = 0; j < 14; j++)
        {
            regionPrediction->push_back(modelOutput[0].tensor<float, 4>()(0,i,j,0));
        }
    }

    iEvent.put(std::move(regionPrediction), "regionPrediction");
}


template<typename T>
std::vector<T> CICADAInputNetworkProducer::getNLeadingObjects(int nObj, const BXVector<T>& theVector)
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
std::vector<float> CICADAInputNetworkProducer::turnParticleVectorsIntoInputVector(int nObj, const std::vector<T>& theVector)
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

std::vector<float> CICADAInputNetworkProducer::turnEtSumVectorsIntoInputVector(const std::vector<l1t::EtSum>& theVector)
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

void CICADAInputNetworkProducer::insertFeatureVectorIntoTensor(const int startIndex, const std::vector<float>& theFeatures, tensorflow::Tensor& theTensor)
{
    int tensorIndex = startIndex;
    for (auto it = theFeatures.begin(); it != theFeatures.end(); ++it)
    {
        theTensor.tensor<float, 2>()(0, tensorIndex) = *it;
        tensorIndex++;
    }
}

void CICADAInputNetworkProducer::fillDescriptions(edm::ConfigurationDescriptions& descriptions)
{
    edm::ParameterSetDescription desc;
    desc.add<string>("CICADAInputNetworkLocation", "/src/anomalyDetection/miniCICADA/data/CICADAInputNetwork_v1/");
    desc.add<edm::InputTag>("EGammaSrc", edm::InputTag("caloStage2Digis","EGamma"));
    desc.add<edm::InputTag>("JetSrc", edm::InputTag("caloStage2Digis","Jet"));
    desc.add<edm::InputTag>("TauSrc", edm::InputTag("caloStage2Digis","Tau"));
    desc.add<edm::InputTag>("EtSrc", edm::InputTag("caloStage2Digis","EtSum"));
    descriptions.addDefault(desc);
}

DEFINE_FWK_MODULE(CICADAInputNetworkProducer);