#include <memory>
#include <cmath>
#include <string>

#include "FWCore/Framework/interface/Frameworkfwd.h"
#include "FWCore/Framework/interface/stream/EDProducer.h"

#include "FWCore/Framework/interface/Event.h"
#include "FWCore/Framework/interface/MakerMacros.h"

#include "FWCore/ParameterSet/interface/ParameterSet.h"

//Anomaly detection includes
#include "ap_fixed.h"
#include "hls4ml/emulator.h"

template<class T1, class T2>
class CICADAFromPredictionProducer : public edm::stream::EDProducer<> {

    public:
        explicit CICADAFromPredictionProducer(const edm::ParameterSet&);
        ~CICADAFromPredictionProducer() override {};

    private:
        void produce(edm::Event&, const edm::EventSetup&) override;

        void beginRun(edm::Run const&, edm::EventSetup const&) override {};

        void readVectorToArray(const std::vector<float>& theVector, unsigned short int (&theArray)[18][14]);

        edm::InputTag predictionTag;

        hls4mlEmulator::ModelLoader loader;
        std::shared_ptr<hls4mlEmulator::Model> model;
};

template<class T1, class T2>
CICADAFromPredictionProducer<T1, T2>::CICADAFromPredictionProducer(const edm::ParameterSet& iConfig):
    predictionTag(iConfig.getParameter<edm::InputTag>("predictionSource")),
    loader(hls4mlEmulator::ModelLoader(iConfig.getParameter<std::string>("CICADAModelVersion")))
{
     consumes<std::vector<float>>(predictionTag);

    model = loader.load_model();
    produces<float>("anomalyScore");
}

template<class T1, class T2>
void CICADAFromPredictionProducer<T1, T2>::produce(edm::Event& iEvent, const edm::EventSetup& iSetup)
{
    std::unique_ptr<float> anomalyScore = std::make_unique<float>();
    edm::Handle< std::vector<float> > predictionHandle;

    iEvent.getByLabel(predictionTag, predictionHandle);

    unsigned short int intermediateMatrix[18][14];

    readVectorToArray(*predictionHandle, intermediateMatrix);

    T1 modelInput[252];
    for(int i = 0; i<18; ++i)
    {
        for(int j = 0; j < 14; ++j)
        {
            modelInput[14*i+j]=intermediateMatrix[i][j];
        }
    }
    T2 modelResult[1];
    model->prepare_input(modelInput);
    model->predict();
    model->read_result(modelResult);

    *anomalyScore = modelResult[0].to_float();

    iEvent.put(std::move(anomalyScore), "anomalyScore");
}

template<class T1, class T2>
void CICADAFromPredictionProducer<T1, T2>::readVectorToArray(const std::vector<float>& theVector, unsigned short int (&theArray)[18][14])
{
    for(int i = 0; i < 18; ++i)
    {
        for(int j = 0; j < 14; ++j)
        {
            theArray[i][j] = std::floor(theVector.at(i*14+j));
        }
    }
}

typedef CICADAFromPredictionProducer< ap_ufixed<10, 10>, ap_fixed<11, 5> > CICADAv1FromPredictionProducer;
typedef CICADAFromPredictionProducer< ap_uint<10>, ap_ufixed<16, 8> > CICADAv2FromPredictionProducer;

DEFINE_FWK_MODULE(CICADAv1FromPredictionProducer);
DEFINE_FWK_MODULE(CICADAv2FromPredictionProducer);