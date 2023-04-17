import FWCore.ParameterSet.Config as cms

from Configuration.Eras.Era_Run2_2018_cff import Run2_2018

import FWCore.ParameterSet.VarParsing as VarParsing
options = VarParsing.VarParsing ('analysis')
options.parseArguments()

process = cms.Process("NTUPLIZE",Run2_2018)
process.load('Configuration.StandardSequences.Services_cff')
process.load('SimGeneral.HepPDTESSource.pythiapdt_cfi')
process.load('FWCore.MessageService.MessageLogger_cfi')
process.load('Configuration.EventContent.EventContent_cff')
process.load('Configuration.StandardSequences.GeometryRecoDB_cff')
process.load('Configuration.StandardSequences.MagneticField_cff')
process.load('Configuration.StandardSequences.RawToDigi_Data_cff')
process.load('Configuration.StandardSequences.EndOfProcess_cff')
process.load('Configuration.StandardSequences.FrontierConditions_GlobalTag_cff')

process.maxEvents = cms.untracked.PSet(
    input = cms.untracked.int32(options.maxEvents)
)
process.MessageLogger.cerr.FwkReport.reportEvery = 10000

#attempt to get rid of muon shower warning
process.MessageLogger.suppressWarning = cms.untracked.vstring(
    'l1UpgradeTree',
    'l1UpgradeEmuTree',
    'l1UpgradeTfMuonShowerTree', 
    'emtfStage2Digis', 
    'l1uGTTestcrateTree', 
    'simDtTriggerPrimitiveDigis'
)

#Define out input source
process.source = cms.Source("PoolSource",
                            fileNames = cms.untracked.vstring('/store/data/Run2018D/EphemeralZeroBias2/MINIAOD/PromptReco-v2/000/320/497/00000/22EA8756-6395-E811-A29D-02163E019FE1.root'),
                            secondaryFileNames = cms.untracked.vstring(
                                '/store/data/Run2018D/EphemeralZeroBias2/RAW/v1/000/320/497/00000/128A5822-CA93-E811-9F04-FA163ECFF8BE.root',
                                '/store/data/Run2018D/EphemeralZeroBias2/RAW/v1/000/320/497/00000/54967CD9-C893-E811-BE8B-FA163E085754.root',
                                '/store/data/Run2018D/EphemeralZeroBias2/RAW/v1/000/320/497/00000/8437145A-CB93-E811-A6AD-FA163E222D2C.root',
                                '/store/data/Run2018D/EphemeralZeroBias2/RAW/v1/000/320/497/00000/B48ECE7A-C893-E811-BFC7-FA163E33D73A.root',
                                '/store/data/Run2018D/EphemeralZeroBias2/RAW/v1/000/320/497/00000/CC8A25EB-C993-E811-AB4A-FA163E48E52D.root',
                                '/store/data/Run2018D/EphemeralZeroBias2/RAW/v1/000/320/497/00000/D2402298-C893-E811-8D87-02163E00CE99.root',
                                '/store/data/Run2018D/EphemeralZeroBias2/RAW/v1/000/320/497/00000/F042C778-C893-E811-B840-FA163E365B83.root'
                            )
)

process.options = cms.untracked.PSet(
    FailPath = cms.untracked.vstring(),
    IgnoreCompletely = cms.untracked.vstring(),
    Rethrow = cms.untracked.vstring(),
    SkipEvent = cms.untracked.vstring(),
    allowUnscheduled = cms.obsolete.untracked.bool,
    canDeleteEarly = cms.untracked.vstring(),
    deleteNonConsumedUnscheduledModules = cms.untracked.bool(True),
    dumpOptions = cms.untracked.bool(False),
    emptyRunLumiMode = cms.obsolete.untracked.string,
    eventSetup = cms.untracked.PSet(
        forceNumberOfConcurrentIOVs = cms.untracked.PSet(
            allowAnyLabel_=cms.required.untracked.uint32
        ),
        numberOfConcurrentIOVs = cms.untracked.uint32(0)
    ),
    fileMode = cms.untracked.string('FULLMERGE'),
    forceEventSetupCacheClearOnNewRun = cms.untracked.bool(False),
    makeTriggerResults = cms.obsolete.untracked.bool,
    numberOfConcurrentLuminosityBlocks = cms.untracked.uint32(0),
    numberOfConcurrentRuns = cms.untracked.uint32(1),
    numberOfStreams = cms.untracked.uint32(0),
    numberOfThreads = cms.untracked.uint32(1),
    printDependencies = cms.untracked.bool(False),
    sizeOfStackForThreadsInKB = cms.optional.untracked.uint32,
    throwIfIllegalParameter = cms.untracked.bool(True),
    wantSummary = cms.untracked.bool(False)
)

from Configuration.AlCa.GlobalTag import GlobalTag
process.GlobalTag = GlobalTag(process.GlobalTag, 'auto:run2_data', '')

process.raw2digi_step = cms.Path(process.RawToDigi)
process.endjob_step = cms.EndPath(process.endOfProcess)

# Schedule definition
process.schedule = cms.Schedule(process.raw2digi_step, process.endjob_step)
from PhysicsTools.PatAlgos.tools.helpers import associatePatAlgosToolsTask
associatePatAlgosToolsTask(process)

#Setup FWK for multithreaded
process.options.numberOfThreads = 1
process.options.numberOfStreams = 1
process.options.numberOfConcurrentLuminosityBlocks = 1
process.options.eventSetup.numberOfConcurrentIOVs = 1
if hasattr(process, 'DQMStore'): process.DQMStore.assertLegacySafe=cms.untracked.bool(False)
# Automatic addition of the customisation function from L1Trigger.Configuration.customiseReEmul
from L1Trigger.Configuration.customiseReEmul import L1TReEmulFromRAW 

#call to customisation function L1TReEmulFromRAW imported from L1Trigger.Configuration.customiseReEmul
process = L1TReEmulFromRAW(process)

# Automatic addition of the customisation function from L1Trigger.L1TNtuples.customiseL1Ntuple
#from L1Trigger.L1TNtuples.customiseL1Ntuple import L1NtupleRAWEMU 

#call to customisation function L1NtupleRAWEMU imported from L1Trigger.L1TNtuples.customiseL1Ntuple
#process = L1NtupleRAWEMU(process)

# Automatic addition of the customisation function from L1Trigger.Configuration.customiseSettings
from L1Trigger.Configuration.customiseSettings import L1TSettingsToCaloParams_2018_v1_3 

#call to customisation function L1TSettingsToCaloParams_2018_v1_3 imported from L1Trigger.Configuration.customiseSettings
process = L1TSettingsToCaloParams_2018_v1_3(process)

#load up our ntuplization stuff and append it on to the end of the schedule
process.load('L1Trigger.L1TCaloLayer1.uct2016EmulatorDigis_cfi')
#process.CaloSummaryPath = cms.Path(process.uct2016EmulatorDigis)
#process.schedule.append(process.CaloSummaryPath)

process.load('L1Trigger.anomalyTriggerSkunkworks.uGTADEmulator_cfi')
#process.uGTEmulationPath = cms.Path(process.uGTADEmulator)
#process.schedule.append(process.uGTEmulationPath)

#get the pileup network
process.load('L1Trigger.anomalyTriggerSkunkworks.pileupNetworkProducer_cfi')

process.productionTask = cms.Task(
    process.uct2016EmulatorDigis,
    process.uGTADEmulator,
    #process.pileupNetworkProducer,
)

process.productionPath = cms.Path(process.productionTask)

process.schedule.append(process.productionPath)

process.load('L1Trigger.anomalyTriggerSkunkworks.L1TCaloSummaryTestNtuplizer_cfi')
process.L1TCaloSummaryTestNtuplizer.ecalToken = cms.InputTag('simEcalTriggerPrimitiveDigis')
process.L1TCaloSummaryTestNtuplizer.hcalToken = cms.InputTag('simHcalTriggerPrimitiveDigis')

process.load('L1Trigger.anomalyTriggerSkunkworks.L1TTriggerBitsNtuplizer_cfi')
process.L1TTriggerBitsNtuplizer.verboseDebug= cms.bool(False)

process.load('L1Trigger.anomalyTriggerSkunkworks.boostedJetTriggerNtuplizer_cfi')

process.load('L1Trigger.anomalyTriggerSkunkworks.uGTModelNtuplizer_cfi')

process.load('L1Trigger.anomalyTriggerSkunkworks.pileupNetworkNtuplizer_cfi')


process.TFileService = cms.Service(
	"TFileService",
	#fileName = cms.string("l1TNtuple-test.root")
        fileName = cms.string(options.outputFile)
)
process.NtuplePath = cms.Path(
                                process.L1TCaloSummaryTestNtuplizer +
                                #process.L1TTriggerBitsNtuplizer +
                                #process.boostedJetTriggerNtuplizer +
                                process.uGTModelNtuplizer #+
                                #process.pileupNetworkNtuplizer
                              )
process.schedule.append(process.NtuplePath)

process.load('L1Trigger.miniCICADA.PFcandSequence_cfi')
process.load('L1Trigger.miniCICADA.electronInformationAnalyzer_cfi')
process.load('L1Trigger.miniCICADA.pileupInformationNtuplizer_cfi')


process.miniNtuplePath = cms.Path(
    process.PFcandSequence +
    process.pileupInformationNtuplizer 
    #process.electronInformationAnalyzer
)
process.schedule.append(process.miniNtuplePath)