from sklearn.model_selection import train_test_split
import h5py
import numpy as np
from tensorflow import keras
import time
from createMiniCICADAOneArray import loadExistingTrainValTestArrays
import argparse
from keras_tuner import HyperModel, BayesianOptimization

class cicadaInputModel(HyperModel):
    def __init__(self, input_shape):
        self.input_shape = input_shape

    def build(self, hp):
        model = keras.models.Sequential([
            keras.layers.Input(shape=self.input_shape),
            keras.layers.BatchNormalization(),
            keras.layers.Dropout(
                hp.Float(
                    'dropout_1',
                    min_value=0.0,
                    max_value=0.5,
                    step=0.1,
                )
            ),

            keras.layers.Dense(
                hp.Int(
                    'dense_1',
                    min_value=252,
                    max_value=252*4,
                    step=252,
                )
            ),
            keras.layers.PReLU(),
            keras.layers.BatchNormalization(),
            keras.layers.Dropout(
                hp.Float(
                    'dropout_2',
                    min_value=0.0,
                    max_value=0.5,
                    step=0.1
                )
            ),

            keras.layers.Dense(
                hp.Int(
                    'dense_2',
                    min_value=252,
                    max_value=252*4,
                    step=252,
                )
            ),
            keras.layers.PReLU(),
            keras.layers.BatchNormalization(),
            keras.layers.Dropout(
                hp.Float(
                    'dropout_3',
                    min_value=0.0,
                    max_value=0.5,
                    step=0.1
                )
            ),

            keras.layers.Reshape((18,14,-1)),

            keras.layers.Conv2D(
                hp.Int(
                    'Conv2D_1_filters',
                    min_value=2,
                    max_value=16,
                    step=2
                ),
                kernel_size=hp.Int(
                    'Conv2D_1_kernel_size',
                    min_value=3,
                    max_value=7,
                    step=2
                ),
                padding="same",
                activation="relu"
            ),
            keras.layers.LayerNormalization(),

            keras.layers.Conv2D(
                hp.Int(
                    'Conv2D_2_filters',
                    min_value=2,
                    max_value=16,
                    step=2
                ),
                kernel_size=hp.Int(
                    'Conv2D_2_kernel_size',
                    min_value=3,
                    max_value=7,
                    step=2
                ),
                padding="same",
                activation="relu"
            ),
            keras.layers.LayerNormalization(),

            keras.layers.Conv2D(
                1,
                kernel_size=hp.Int(
                    'Conv2D_3_kernel_size',
                    min_value=3,
                    max_value=7,
                    step=2
                ),
                padding="same",
                activation="relu"
            ),
        ])

        model.compile(
            loss='mse',
            optimizer='nadam',
            metrics=[keras.metrics.RootMeanSquaredError(), keras.metrics.MeanAbsoluteError()],            
        )
        return model

def createTrainValTestArrays(inputFileForShuffle, outputFileForShuffle):
    print('loading information...')
    startTime = time.perf_counter()
    with h5py.File(inputFileForShuffle) as inputFile:
        cicadaInputArray = np.array(inputFile['cicadaInput'][:int(4.0e6)])
        inputArray = np.array(inputFile['electrons'][:int(4.0e6)])
        inputArray = np.append(inputArray, np.array(inputFile['jets'][:int(4.0e6)]), axis=1)
        inputArray = np.append(inputArray, np.array(inputFile['taus'][:int(4.0e6)]), axis=1)
        inputArray = np.append(inputArray, np.array(inputFile['EtSums'][:int(4.0e6)]), axis=1)
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

    metaModel = cicadaInputModel(train_input.shape[1:])
    tuner = BayesianOptimization(
        metaModel,
        objective='val_loss',
        max_trials=20,
        directory = 'tunerDir',
        project_name = 'cicadaInputNetwork_tuning'
    )

    tuner.search(
        x=train_input,
        y=train_output,
        epochs=10,
        steps_per_epoch=1000,
        validation_steps=1000,
        validation_data=(val_input, val_output)
    )
    model=tuner.get_best_models(num_models=1)[0]

    model.summary()

    model.save(
        model,
        filepath="tunedCICADAInputNetwork",
        save_format="tf"
    )

if __name__ == '__main__':
    parser =argparse.ArgumentParser(description='Perform a miniCICADA training')
    parser.add_argument('--performValidation', action='store_true',help='Perform the plot creation step immediately after training')
    parser.add_argument('--loadExistingShuffle', action='store_true',help='Load existing split files, otherwise the will be created again and overwritten')
    parser.add_argument('--histogramEntries',type=int,default=100000,help='Number of entries to test plots for')
    parser.add_argument('--inputFileForShuffle',default='/nfs_scratch/aloeliger/testHDF5Files/largeInputFile.hdf5',help='file to load to shuffle')
    parser.add_argument('--shuffledFile',default='/nfs_scratch/aloeliger/cicadaInputNetworkTraining.hdf5',help='File to output for the shuffle, or to load from shuffle')

    args = parser.parse_args()
    main(args)