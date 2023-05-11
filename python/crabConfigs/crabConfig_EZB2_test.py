from CRABClient.UserUtilities import config
import os
import datetime

config = config()
todaysDate = datetime.date.today().strftime('%d%b%Y')

config.General.requestName = f'miniCICADA_EZB2_{todaysDate}_Test'
config.General.workArea = 'crabWorkArea'
config.General.transferOutputs = True

config.JobType.pluginname = 'Analysis'
config.JobType.psetName = f'{os.environ["CMSSW_BASE"]}/src/anomalyDetection/miniCICADA/python/ntuplizeMiniCICADA.py'
config.JobType.maxMemoryMB = 4000
cicadaPath = f'{os.environ["CMSSW_BASE"]}/src/anomalyDetection/CICADA'
if os.path.isdir(cicadaPath):
    config.JobType.inputFiles=[cicadaPath]

config.Data.inputDataset = '/EphemeralZeroBias2/Run2018D-PromptReco-v2/MINIAOD'
config.Data.secondaryInputDataset = '/EphemeralZeroBias2/Run2018D-v1/RAW'
config.Data.inputDBS = 'global'
config.Data.splitting = 'LumiBased'
config.Data.unitsPerJob = 5
config.Data.totalUnits = 100
config.Data.lumiMask = 'https://cms-service-dqmdc.web.cern.ch/CAF/certification/Collisions18/13TeV/Legacy_2018/Cert_314472-325175_13TeV_Legacy2018_Collisions18_JSON.txt'
config.Data.publication = False
config.Data.outputDatasetTag = f'CICADA_EphemeralZeroBias2_{todaysDate}'

config.Site.storageSite = 'T2_US_Wisconsin'
