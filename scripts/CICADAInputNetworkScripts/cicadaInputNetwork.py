import h5py
from tensorflow import keras
import argparse
import math
import numpy as np

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

    model = keras.models.Sequential([
        keras.layers.Input(shape=trainSequence.batchShape),
        keras.layers.BatchNormalization(),
        # keras.layers.Dropout(0.2),
        
        keras.layers.Dense(1008),
        keras.layers.PReLU(),
        keras.layers.BatchNormalization(),
        # keras.layers.Dropout(0.2),

        keras.layers.Dense(756),
        keras.layers.PReLU(),
        keras.layers.BatchNormalization(),
        # keras.layers.ActivityRegularization(l1=1e-3,l2=1e-3),
        keras.layers.Dropout(0.2),

        keras.layers.Reshape((18, 14, -1)),

        keras.layers.Conv2D(2, kernel_size=7, padding="same"),
        keras.layers.PReLU(),
        keras.layers.LayerNormalization(),

        keras.layers.Conv2D(10, kernel_size=3, padding="same"),
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
    # nanTermination = keras.callbacks.TerminateOnNaN()

    earlyStop = keras.callbacks.EarlyStopping(
        patience=6,
    )

    try:
        model.fit(
            trainSequence,
            epochs=500,
            validation_data=valSequence,
            # steps_per_epoch = 2000,
            # validation_steps = 2000,
            callbacks = [
                checkpointCallback,
                # nanTermination,
                earlyStop,
            ]
        )
    except KeyboardInterrupt:
        pass


if __name__ == '__main__':
    parser =argparse.ArgumentParser(description='Perform a miniCICADA training')
    parser.add_argument('--inputFile', nargs='?', required=True, help='hdf5 file to build a sequence from')

    args = parser.parse_args()
    main(args)