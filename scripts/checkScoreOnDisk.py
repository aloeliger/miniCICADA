import ROOT
import os

from anomalyDetection.miniCICADA.scriptIncludes.fileList import theFiles

if __name__ == '__main__':
    theChain = ROOT.TChain('L1TCaloSummaryTestNtuplizer/L1TCaloSummaryOutput')
    for theFile in theFiles:
        theChain.Add(theFile)

    print(theChain.GetEntries())

    theCanvas = ROOT.TCanvas()
    theCanvas.SetLogy()

    theChain.Draw('anomalyScore','','P E1')

    theCanvas.SaveAs('scoreDistribution.png')
