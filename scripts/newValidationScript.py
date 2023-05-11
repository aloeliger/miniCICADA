import ROOT
from tensorflow import keras
from tqdm import trange
from anomalyDetection.miniCICADA.scriptIncludes.fileList import theFiles
from createHDF5File import *
import numpy as np

def get2DArray(theDataset):
    return np.expand_dims(theDataset.creationFunction(*theDataset.inputs), axis=0)

def appendTo2DArray(theDataset, array):
    return np.append(array, get2DArray(theDataset), axis=1)

def main():
    ROOT.gStyle.SetOptStat(0)

    model = keras.models.load_model('./miniCICADAModel')

    chains = prepareInputChains()

    allDatasets = setupDatasets(chains)

    totalEntries = chains['anomalyChain'].GetEntries()
    
    scoreMin = chains['anomalyChain'].GetMaximum('anomalyScore')
    scoreMax = chains['anomalyChain'].GetMinimum('anomalyScore')

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
    
    #for index in trange(totalEntries):
    for index in trange(100000):
        for chainName in chains:
            chains[chainName].GetEntry(index)

        otherInputs = [
            'met',
            'nEGamma',
            'nJet',
            'nTau',
            *[f'EGamma_{i}' for i in range(3)],
            *[f'Jet_{i}' for i in range(4)],
            *[f'Tau_{i}' for i in range(4)],
            *[f'EtSum_{i}' for i in range(4)],
            'electronCounter',
            'jetCounter',
            'fatJetCounter',
            'photonCounter',
            'tauCounter',
            'boostedTauCounter',
        ]
        array = get2DArray(allDatasets['npv'])
        # print(array.shape)
        for inputName in otherInputs:
            array = appendTo2DArray(allDatasets[inputName], array)
            # print(inputName)
            # print(array.shape)
        
        modelPrediction = model.predict(array)[0][0]
        anomalyScore = chains['anomalyChain'].anomalyScore

        predictionHistogram.Fill(modelPrediction)
        scoreHistogram.Fill(anomalyScore)

        numEntriesHistogram.Fill(anomalyScore)
        errorHistogram.Fill(anomalyScore, abs(anomalyScore-modelPrediction))
    
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

    theLegend = ROOT.TLegend(0.7,0.7,0.9,0.9)
    theLegend.AddEntry(predictionHistogram, 'miniCICADA', 'p')
    theLegend.AddEntry(scoreHistogram, 'CICADA', 'p')
    theLegend.Draw()

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
