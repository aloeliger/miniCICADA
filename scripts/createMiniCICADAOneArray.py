from sklearn.model_selection import train_test_split
import h5py
import numpy as np
from tensorflow import keras
import time
import argparse
from tqdm import trange
import ROOT
import tensorflow as tf

def createTrainValTestArrays():
    print('loading information...')
    startTime = time.perf_counter()
    with h5py.File('/nfs_scratch/aloeliger/testHDF5Files/largeInputFile.hdf5') as inputFile:
        scoreArray = np.array(inputFile['anomalyScore'][:int(3*len(inputFile['anomalyScore'])/4)])
        # scoreArray = np.array(inputFile['anomalyScore'])
        inputArray = np.array(inputFile['input'][:int(3*len(inputFile['input'])/4)])
        # inputArray = np.array(inputFile['input'])

    endTime = time.perf_counter()
    print('loaded!')
    print(f'loaded in {endTime-startTime:.2f} seconds')

    print('Shuffling and splitting')
    startTime = time.perf_counter()
    train_val_input, test_input, train_val_output, test_output = train_test_split(inputArray, scoreArray, train_size = 0.9)

    train_input, val_input, train_output, val_output = train_test_split(train_val_input, train_val_output, train_size=0.7, random_state=1234)
    endTime = time.perf_counter()
    print(f'Shuffled and split in {endTime-startTime:.2f} seconds')

    print('Writing file')
    startTime = time.perf_counter()
    with h5py.File('/nfs_scratch/aloeliger/miniCICADATraining.hdf5','w') as outputFile:
        outputFile.create_dataset('train_input', train_input.shape)
        outputFile.create_dataset('train_output', train_output.shape)
        outputFile.create_dataset('val_input', val_input.shape)
        outputFile.create_dataset('val_output', val_output.shape)
        outputFile.create_dataset('test_input', test_input.shape)
        outputFile.create_dataset('test_output', test_output.shape)

        outputFile['train_input'][:] = train_input[:]
        outputFile['train_output'][:] = train_output[:]
        outputFile['val_input'][:] = val_input[:]
        outputFile['val_output'][:] = val_output[:]
        outputFile['test_input'][:] = test_input[:]
        outputFile['test_output'][:] = test_output[:]

    endTime = time.perf_counter()
    print(f'Written in {endTime-startTime:.2f} seconds')

    return train_input, train_output, val_input, val_output, test_input, test_output

def loadExistingTrainValTestArrays():
    print('loading information...')
    startTime = time.perf_counter()
    with h5py.File('/nfs_scratch/aloeliger/miniCICADATraining.hdf5') as theFile:
        train_input = np.array(theFile['train_input'])
        train_output = np.array(theFile['train_output'])
        val_input = np.array(theFile['val_input'])
        val_output = np.array(theFile['val_output'])
        test_input = np.array(theFile['test_input'])
        test_output = np.array(theFile['test_output'])
    endTime = time.perf_counter()
    print('loaded!')
    print(f'loaded in {endTime-startTime:.2f} seconds')

    return train_input, train_output, val_input, val_output, test_input, test_output


def main(args):

    if args.loadExistingShuffle:
        train_input, train_output, val_input, val_output, test_input, test_output = loadExistingTrainValTestArrays()
    else:
        train_input, train_output, val_input, val_output, test_input, test_output = createTrainValTestArrays()

    print('Input shapes:')
    train_input_shape = f'Train: {train_input.shape}'
    val_input_shape = f'Val: {val_input.shape}'
    test_input_shape = f'Test: {test_input.shape}'
    print(f'{train_input_shape:^18} {val_input_shape:^18} {test_input_shape:^18}')
    print('output_shapes:')
    train_output_shape = f'Train: {train_output.shape}'
    val_output_shape = f'Val: {val_output.shape}'
    test_output_shape = f'Test: {test_output.shape}'
    print(f'{train_output_shape:^18} {val_output_shape:^18} {test_output_shape:^18}')

    model = keras.models.Sequential([
        keras.layers.Input(shape=train_input.shape[1:]),
        keras.layers.BatchNormalization(),
        keras.layers.Dropout(0.2),
        keras.layers.Dense(128),
        keras.layers.PReLU(),
        keras.layers.BatchNormalization(),
        keras.layers.Dropout(0.2),

        keras.layers.Dense(128),
        keras.layers.PReLU(),
        keras.layers.BatchNormalization(),
        keras.layers.Dropout(0.2),

        keras.layers.Dense(64),
        keras.layers.PReLU(),
        keras.layers.BatchNormalization(),
        keras.layers.Dropout(0.2),

        keras.layers.Dense(1, activation='softplus')
    ])

    # def custom_loss_fn(y_true, y_pred):
    #     weighted_squared_difference = y_true * tf.square(y_true-y_pred)
    #     return tf.reduce_mean(weighted_squared_difference, axis=-1)

    model.compile(
        loss='mse',
        optimizer='nadam',
        metrics=[keras.metrics.RootMeanSquaredError(), keras.metrics.MeanAbsoluteError()],
    )
    # model.compile(
    #     loss = 'mae',
    #     optimizer='nadam',
    #     metrics=[keras.metrics.MeanSquaredError(),keras.metrics.RootMeanSquaredError()],
    # )
    # model.compile(
    #     loss=custom_loss_fn ,
    #     optimizer='nadam',
    #     metrics=[keras.metrics.MeanSquaredError(), keras.metrics.RootMeanSquaredError(), keras.metrics.MeanAbsoluteError()],
    # )

    model.summary()

    checkpointCallback = keras.callbacks.ModelCheckpoint(
        "./miniCICADAModel",
        monitor = 'val_loss',
        save_best_only = True,
    )
    LRScheduler = keras.callbacks.ReduceLROnPlateau(
        monitor="val_loss",
        patience = 5,
    )
    nanTermination = keras.callbacks.TerminateOnNaN()

    try:
        model.fit(
            x=train_input,
            y=train_output,
            epochs=10,
            validation_data=(val_input, val_output),
            steps_per_epoch = 1000,
            validation_steps = 1000,
            #batch_size=3200,
            callbacks = [
                checkpointCallback,
                #LRScheduler,
                nanTermination,
            ],
            #workers=4,
            #use_multiprocessing=True
        )
    except KeyboardInterrupt:
        pass

    if args.performValidation:
        ROOT.gStyle.SetOptStat(0)
        model = keras.models.load_model(
            './miniCICADAModel', 
            # custom_objects={'custom_loss_fn':custom_loss_fn}
        )

        scoreMin = np.amin(test_output)
        scoreMax = np.amax(test_output)        

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

        testEntries = min(len(test_output),args.histogramEntries)
        for index in trange(testEntries, ncols=40):
            modelPrediction = model.predict(test_input[index:index+1])
            anomalyScore = test_output[index:index+1]

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
    parser =argparse.ArgumentParser(description='Perform a miniCICADA training')
    parser.add_argument('--performValidation', action='store_true',help='Perform the plot creation step immediately after training')
    parser.add_argument('--loadExistingShuffle', action='store_true',help='Load existing split files, otherwise the will be created again and overwritten')
    parser.add_argument('--histogramEntries',type=int,default=100000,help='Number of entries to test plots for')

    args = parser.parse_args()
    main(args)