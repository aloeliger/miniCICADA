import ROOT
import os

basePath = '/hdfs/store/user/aloelige'
""" filePaths = (
    f'{basePath}/EphemeralZeroBias2/CICADA_EphemeralZeroBias2_15Apr2023/230415_073918/0000/',
    f'{basePath}/EphemeralZeroBias4/CICADA_EphemeralZeroBias4_15Apr2023/230415_081348/0000/',
    f'{basePath}/EphemeralZeroBias7/CICADA_EphemeralZeroBias7_15Apr2023/230415_081443/0000/',
) """

filePaths = (
    f'{basePath}/EphemeralZeroBias2/CICADA_EphemeralZeroBias2_15Apr2023/',
    f'{basePath}/EphemeralZeroBias4/CICADA_EphemeralZeroBias4_15Apr2023/',
    f'{basePath}/EphemeralZeroBias7/CICADA_EphemeralZeroBias7_15Apr2023/',
)

theFiles = []

for filePath in filePaths:
    for root, dirs, files in os.walk(filePath, topdown=True):
        for name in files:
            theFiles.append(os.path.join(root, name))

if __name__ == '__main__':
    theChain = ROOT.TChain('L1TCaloSummaryTestNtuplizer/L1TCaloSummaryOutput')
    for theFile in theFiles:
        theChain.Add(theFile)

    print(theChain.GetEntries())

    theCanvas = ROOT.TCanvas()
    theCanvas.SetLogy()

    theChain.Draw('anomalyScore','','P E1')

    theCanvas.SaveAs('scoreDistribution.png')