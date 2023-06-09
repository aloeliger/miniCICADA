import h5py
import numpy as np
from tensorflow import keras
import argparse
import math
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

class CICADAInputSequence(keras.utils.Sequence):
    def __init__(self, fileName, batchSize, startEntry, endEntry):
        self.fileName = fileName
        self.batchSize = batchSize
        self.startEntry = startEntry
        self.endEntry = endEntry

        self.hdf5File = h5py.File(self.fileName, 'r')

        self.totalBatches = (self.endEntry-self.startEntry) // self.batchSize

        #self.batchShape = self.hdf5File['input'][0].shape
        firstElectronBatch = self.hdf5File['electrons'][0]
        firstJetBatch = self.hdf5File['jets'][0]
        firstTauBatch = self.hdf5File['taus'][0]
        firstSumBatch = self.hdf5File['EtSums'][0]
        theArray = np.append(firstElectronBatch, firstJetBatch)
        theArray = np.append(theArray, firstTauBatch)
        theArray = np.append(theArray, firstSumBatch)
        self.batchShape = theArray.shape
        
        self.outputShape = self.hdf5File['cicadaInput'][0].shape
    
    def __len__(self):
        return self.totalBatches

    def __getitem__(self, index):
        start = self.startEntry + (index * self.batchSize)
        end = self.startEntry + ((index+1) * self.batchSize)

        #electronData = self.hdf5File['input'][start:end]
        batch_data = self.hdf5File['electrons'][start:end]
        batch_data = np.append(batch_data, self.hdf5File['jets'][start:end], axis=1)
        batch_data = np.append(batch_data, self.hdf5File['taus'][start:end], axis=1)
        batch_data = np.append(batch_data, self.hdf5File['EtSums'][start:end], axis=1)
        batch_output = self.hdf5File['cicadaInput'][start:end]

        return batch_data, batch_output

    def on_epoch_end(self):
        pass
    
    def __del__(self):
        self.hdf5File.close()

def main(args):

    with h5py.File(args.inputFile) as theFile:
        totalEntries = len(theFile['cicadaInput'])

    trainEntries = math.floor(0.7*totalEntries)
    valEntries = math.floor(0.2*totalEntries)
    testEntries = math.floor(0.1*totalEntries)

    trainSequence = CICADAInputSequence(
        fileName=args.inputFile,
        batchSize=3200,
        startEntry=0,
        endEntry=trainEntries
    )

    valSequence = CICADAInputSequence(
        fileName=args.inputFile,
        batchSize=3200,
        startEntry=trainEntries+1,
        endEntry=trainEntries+1+valEntries
    )

    testEntries=CICADAInputSequence(
        fileName=args.inputFile,
        batchSize=3200,
        startEntry=trainEntries+1+valEntries+1,
        endEntry=totalEntries
    )

    print('Input shapes:')
    train_input_shape = f'Train: {len(trainSequence)} {trainSequence.batchShape}'
    val_input_shape = f'Val: {len(valSequence)} {valSequence.batchShape}'
    test_input_shape = f'Test: {len(testEntries)} {testEntries.batchShape}'
    print(f'{train_input_shape:^18} {val_input_shape:^18} {test_input_shape:^18}')
    print('output_shapes:')
    
    train_output_shape = f'Train: {len(trainSequence)} {trainSequence.outputShape}'
    val_output_shape = f'Val: {len(valSequence)} {valSequence.outputShape}'
    test_output_shape = f'Test: {len(testEntries)} {testEntries.outputShape}'
    print(f'{train_output_shape:^18} {val_output_shape:^18} {test_output_shape:^18}')


    metaModel = cicadaInputModel(trainSequence.batchShape)

    earlyStop = keras.callbacks.EarlyStopping(
        patience=6,
    )

    tuner = BayesianOptimization(
        metaModel,
        objective='val_loss',
        max_trials=12,
        directory = 'tunerDir',
        project_name = args.tunerModel,
    )

    tuner.search(
        trainSequence,
        epochs=10,
        # steps_per_epoch=1000,
        # validation_steps=1000,
        validation_data=valSequence,
        callbacks=[earlyStop]
    )
    model=tuner.get_best_models(num_models=1)[0]

    model.summary()

    model.save(
        filepath=args.tunerModel,
        save_format="tf"
    )

if __name__ == '__main__':
    parser =argparse.ArgumentParser(description='Perform a miniCICADA training')
    parser.add_argument('--inputFile', nargs='?', required=True, help='hdf5 file to build a sequence from')
    parser.add_argument('--tunerModel', nargs='?', required=True, help='Name of the model to tune')

    args = parser.parse_args()
    main(args)