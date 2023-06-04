from sklearn.model_selection import train_test_split
import h5py
import numpy as np
from tensorflow import keras
import time
from createMiniCICADAOneArray import loadExistingTrainValTestArrays
import argparse

def createTrainValTestArrays(inputFileForShuffle, outputFileForShuffle):
    print('loading information...')
    startTime = time.perf_counter()
    with h5py.File(inputFileForShuffle) as inputFile:
        cicadaInputArray = np.array(inputFile['cicadaInput'][:int(5.0e6)])
        inputArray = np.array(inputFile['input'][:int(5.0e6)])
    endTime = time.perf_counter()
    print('Loaded!')
    print(f'Loaded in {endTime-startTime:.2f} seconds.')

    print('Shuffling and splitting')
    startTime = time.perf_counter()
    train_val_input, test_input, train_val_output, test_output = train_test_split(inputArray, cicadaInputArray, train_size=0.9, random_state=1234)

    train_input, val_input, train_output, val_output = train_test_split(train_val_input, train_val_output, train_size=0.7, random_state=1234)
    endTime=time.perf_counter()
    print(f'Shuffled and split in {endTime-startTime:.2f} seconds')

    print('Writing file')
    startTime = time.perf_counter()
    with h5py.File(outputFileForShuffle, 'w') as outputFile:
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

def main(args):

    if args.loadExistingShuffle:
        train_input, train_output, val_input, val_output, test_input, test_output = loadExistingTrainValTestArrays(
            shuffledFile=args.shuffledFile,
        )
    else:
        train_input, train_output, val_input, val_output, test_input, test_output = createTrainValTestArrays(
            inputFileForShuffle=args.inputFileForShuffle,
            outputFileForShuffle=args.shuffledFile,
        )

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
        
        keras.layers.Dense(252),
        keras.layers.PReLU(),
        keras.layers.BatchNormalization(),
        keras.layers.Dropout(0.2),

        keras.layers.Dense(504),
        keras.layers.PReLU(),
        keras.layers.BatchNormalization(),
        keras.layers.ActivityRegularization(l1=1e-3,l2=1e-3),
        keras.layers.Dropout(0.2),

        keras.layers.Reshape((18, 14, 2)),

        keras.layers.Conv2D(4, kernel_size=5, padding="same"),
        keras.layers.PReLU(),
        keras.layers.LayerNormalization(),

        keras.layers.Conv2D(8, kernel_size=3, padding="same"),
        keras.layers.PReLU(),
        keras.layers.LayerNormalization(),

        keras.layers.Conv2D(1, kernel_size=3, padding="same"),
        keras.layers.PReLU(),
    ])

    model.compile(
        loss="mse",
        optimizer='nadam',
        metrics=[keras.metrics.RootMeanSquaredError(), keras.metrics.MeanAbsoluteError()],
    )

    model.summary()

    checkpointCallback = keras.callbacks.ModelCheckpoint(
        "./cicadaInputModel",
        monitor="val_loss",
        save_best_only = True,
    )
    nanTermination = keras.callbacks.TerminateOnNaN()

    try:
        model.fit(
            x=train_input,
            y=train_output,
            epochs=10,
            validation_data=(val_input, val_output),
            steps_per_epoch = 2000,
            validation_steps = 2000,
            callbacks = [
                checkpointCallback,
                nanTermination,
            ]
        )
    except KeyboardInterrupt:
        pass


if __name__ == '__main__':
    parser =argparse.ArgumentParser(description='Perform a miniCICADA training')
    parser.add_argument('--performValidation', action='store_true',help='Perform the plot creation step immediately after training')
    parser.add_argument('--loadExistingShuffle', action='store_true',help='Load existing split files, otherwise the will be created again and overwritten')
    parser.add_argument('--histogramEntries',type=int,default=100000,help='Number of entries to test plots for')
    parser.add_argument('--inputFileForShuffle',default='/nfs_scratch/aloeliger/testHDF5Files/largeInputFile.hdf5',help='file to load to shuffle')
    parser.add_argument('--shuffledFile',default='/nfs_scratch/aloeliger/miniCICADATraining.hdf5',help='File to output for the shuffle, or to load from shuffle')

    args = parser.parse_args()
    main(args)