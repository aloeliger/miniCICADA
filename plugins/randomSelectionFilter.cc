// system include files
#include <memory>

// user include files
#include "FWCore/Framework/interface/Frameworkfwd.h"
#include "FWCore/Framework/interface/stream/EDFilter.h"
#include "FWCore/Framework/interface/Event.h"
#include "FWCore/Framework/interface/MakerMacros.h"

#include "FWCore/ParameterSet/interface/ParameterSet.h"

#include "FWCore/Utilities/interface/StreamID.h"
#include "FWCore/Utilities/interface/RandomNumberGenerator.h"

#include "FWCore/ServiceRegistry/interface/Service.h"

#include "CLHEP/Random/RandomEngine.h"


//basic filter
class randomSelectionFilter : public edm::stream::EDFilter<>
{
    public:
        explicit randomSelectionFilter(const edm::ParameterSet&);
        ~randomSelectionFilter() override;

        static void fillDescriptions(edm::ConfigurationDescriptions& descriptions);

    private:
        void beginStream(edm::StreamID) override;
        bool filter(edm::Event&, const edm::EventSetup&) override;
        void endStream() override;

        double reductionRate;
};

randomSelectionFilter::randomSelectionFilter(const edm::ParameterSet& iConfig):
    reductionRate(iConfig.getParameter<double>("reductionRate"))
{}

randomSelectionFilter::~randomSelectionFilter()
{}

bool randomSelectionFilter::filter(edm::Event& iEvent, const edm::EventSetup& iSetup)
{
    using namespace edm;

    edm::Service<edm::RandomNumberGenerator> rng;
    CLHEP::HepRandomEngine& engine = rng->getEngine(iEvent.streamID());
    bool acceptance = engine.flat() <= (1.0/reductionRate);
    return acceptance;
}

void randomSelectionFilter::beginStream(edm::StreamID)
{}

void randomSelectionFilter::endStream()
{}

void randomSelectionFilter::fillDescriptions(edm::ConfigurationDescriptions& descriptions)
{
    edm::ParameterSetDescription desc;
    desc.add<double>("reductionRate", 100.0);
    descriptions.addDefault(desc);
    
}

DEFINE_FWK_MODULE(randomSelectionFilter);