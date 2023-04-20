#!/usr/bin/env 
import os
import subprocess

if __name__ == '__main__':
    miniCICADAVersion = '0p2test'

    nfsLocation = f'/nfs_scratch/aloeliger/miniCICADA/miniCICADA_{miniCICADAVersion}'
    dagLocation = f'{nfsLocation}/dags/'
    submitLocation = f'{nfsLocation}/submit/'
    outputDir = f'/hdfs/store/user/aloelige/miniCICADA/miniCICADA_{miniCICADAVersion}'
    input_files = f'{os.environ["CMSSW_BASE"]}/src/L1Trigger/miniCICADA/metaData/testSubmission.txt'
    scriptToRun = f'{os.environ["CMSSW_BASE"]}/src/L1Trigger/miniCICADA/scripts/createHDF5shuffle_condorSide.py'

    os.makedirs(dagLocation)

    farmoutCommands = [
        'farmoutAnalysisJobs',
        '--fwklite',
        '--vsize-limit 8000',
        '--memory-requirements 8000',
        f'--submit-dir={submitLocation}',
        '--infer-cmssw-path',
        '--input-files-per-job=1',
        f'--input-file-list={input_files}',
        f'--output-dag-file={dagLocation}/dag',
        f'--output-dir={outputDir}',
        '--assume-input-files-exist',
        '--opsys="CentOS7"'
        #'--use-singularity="CentOS7"',
        '--input-dir=/',
        f'skimTest_miniCICADA_{miniCICADAVersion}',
        f'{scriptToRun}',
        '--',
        '\'--inputFile=$inputFileNames\'',
        '\'--outputFile=$outputFileName\''
    ]
    finalCommand = ' '.join(farmoutCommands).lstrip()

    subprocess.run(
        [finalCommand],
        shell=True
    )