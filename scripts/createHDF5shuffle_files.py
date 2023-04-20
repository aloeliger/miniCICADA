from checkScoreOnDisk import theFiles
import ROOT
import random
import os
import time
import math

fileSize = 3200
batchSize = 32

if __name__ == '__main__':
    anomalyChain = ROOT.TChain("L1TCaloSummaryTestNtuplizer/L1TCaloSummaryOutput")

    for name in theFiles:
        anomalyChain.Add(name)

    startTime = time.perf_counter()
    numEntries = anomalyChain.GetEntries()
    endTime = time.perf_counter()

    print(f'Total entries retrieved in {endTime-startTime:0.2f} seconds. Total entries: {numEntries}')

    print(f'Planning a shuffle for file sizes of {fileSize} events, with batches of size {batchSize}.')
    print('Shuffling...')

    entryNumbers = [x for x in range(numEntries)]

    random.seed(1234)
    random.shuffle(entryNumbers)

    print('Shuffled!')
    print('Generating entry groups')

    finalEntryGroups = []
    for groupNum in range(math.floor(len(entryNumbers)/fileSize)): #get rid of anything that is not a complete file
            subgroup = []
            for indexNum in range(fileSize):
                entryIndex = groupNum*fileSize+indexNum
                subgroup.append(entryNumbers[entryIndex])
            finalEntryGroups.append(subgroup)
    print(f'Generated {len(finalEntryGroups)} entry groups/shuffle input files')

    print('Printing to text files')

    os.makedirs('miniCICADAshuffleInputs/',exist_ok=True)

    for i, theList in enumerate(finalEntryGroups):
        with open(f'miniCICADAshuffleInputs/shuffleInput_{i}.txt', 'w') as theFile:
            for entry in theList:
                theFile.write(f'{entry}\n')
    print('Shuffle input generated!')