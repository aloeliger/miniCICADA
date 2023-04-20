import ROOT
from tensorflow import keras
from tqdm import trange
from createMiniCICADA import *
import numpy as np

def main():
    ROOT.gStyle.SetOptStat(0)

    model = keras.models.load_model('./miniCICADAModel') 

    listOfFiles = []
    with open('trainingAndValidationFiles.txt') as fileFile:
        fileContents = fileFile.read()
        fileContents = fileContents.split('Validation Files:\n')[1]
        listOfFiles=fileContents.split('\n')
        listOfFiles.remove('')
    #print(listOfFiles)
    anomalyChain = ROOT.TChain("L1TCaloSummaryTestNtuplizer/L1TCaloSummaryOutput")

    chargedHadronPFchain = ROOT.TChain("chargedHadronPFcandidateAnalyzer/chargedHadronPFcands")
    neutralHadronPFchain = ROOT.TChain("neutralHadronPFcandidateAnalyzer/neutralHadronPFcands")
    muonPFchain = ROOT.TChain("muonPFcandidateAnalyzer/muonPFcands")
    electronPFchain = ROOT.TChain("electronPFcandidateAnalyzer/electronPFcands")
    gammaPFchain = ROOT.TChain("gammaPFcandidateAnalyzer/gammaPFcands")

    for fileName in listOfFiles:
        anomalyChain.Add(fileName)

        chargedHadronPFchain.Add(fileName)
        neutralHadronPFchain.Add(fileName)
        muonPFchain.Add(fileName)
        electronPFchain.Add(fileName)
        gammaPFchain.Add(fileName)
    
    numEntries = anomalyChain.GetEntries()

    scoreMax = anomalyChain.GetMaximum('anomalyScore')
    scoreMin = anomalyChain.GetMinimum('anomalyScore')

    scoreHistogram = ROOT.TH1F(
        'scoreComparison',
        'scoreComparison',
        100,
        scoreMin,
        scoreMax

    )

    predictionHistogram = ROOT.TH1F(
        'predictionHistogram',
        'predictionHistogram',
        100,
        scoreMin,
        scoreMax,
    )

    numEntriesHistogram = ROOT.TH1F(
        'numEntriesHistogram',
        'numEntriesHistogram',
        100,
        scoreMin,
        scoreMax
    )

    errorHistogram = ROOT.TH1F(
        'errorHistogram',
        'errorHistogram',
        100,
        scoreMin,
        scoreMax
    )

    #for i in trange(numEntries):
    for i in trange(1000000):
        anomalyChain.GetEntry(i)
        chargedHadronPFchain.GetEntry(i)
        neutralHadronPFchain.GetEntry(i)
        muonPFchain.GetEntry(i)
        electronPFchain.GetEntry(i)
        gammaPFchain.GetEntry(i)

        if anomalyChain.anomalyScore < 10.0:
            continue

        inputInfo = [makeInputListFromEntry(
            chargedHadronPFcands=chargedHadronPFchain,
            neutralHadronPFcands=neutralHadronPFchain,
            muonPFcands=muonPFchain,
            electronPFcands=electronPFchain,
            gammaPFcands=gammaPFchain,
        )]

        inputInfo = np.array(inputInfo)

        #print(inputInfo.shape)

        modelPrediction = model.predict(inputInfo)
        modelPrediction = modelPrediction[0][0]
        #print(modelPrediction)
        predictionHistogram.Fill(modelPrediction)
        scoreHistogram.Fill(anomalyChain.anomalyScore)

        numEntriesHistogram.Fill(anomalyChain.anomalyScore)
        errorHistogram.Fill(anomalyChain.anomalyScore, abs(anomalyChain.anomalyScore-modelPrediction))

    scoreHistogram.SetMarkerStyle(20)
    scoreHistogram.SetMarkerColor(40)
    scoreHistogram.SetLineColor(40)
    
    predictionHistogram.SetMarkerStyle(20)
    predictionHistogram.SetMarkerColor(46)
    predictionHistogram.SetLineColor(46)

    scoreComparisonCanvas = ROOT.TCanvas("scoreComparison")
    scoreComparisonCanvas.SetLogy()
    scoreHistogram.Draw('E1')
    predictionHistogram.Draw('SAME E1')

    scoreHistogram.GetXaxis().SetTitle('CICADA Score')
    scoreHistogram.GetYaxis().SetTitle('nEntries')
    scoreHistogram.SetTitle('')

    scoreComparisonCanvas.SaveAs('scoreComparison.png')

    errorCanvas = ROOT.TCanvas('errorComparison')
    errorCanvas.SetLogy()
    errorHistogram.Divide(numEntriesHistogram)

    errorHistogram.SetMarkerStyle(20)
    errorHistogram.SetMarkerColor(ROOT.kBlack)
    errorHistogram.SetLineColor(ROOT.kBlack)

    errorHistogram.Draw('E1')

    errorHistogram.GetXaxis().SetTitle('CICADA Score')
    errorHistogram.GetYaxis().SetTitle('Average Absolute Error')
    errorHistogram.SetTitle('')
    errorHistogram.GetYaxis().SetRangeUser(0.01,10)

    errorCanvas.SaveAs('errorComparison.png')



if __name__ == '__main__':
    main()