import h5py
import numpy as np
from tensorflow import keras
import argparse
import math


class miniCICADAInputSequence(keras.utils.Sequence):
    def __init__(self, fileName, batchSize, startEntry, endEntry):
        self.fileName = fileName
        self.batchSize = batchSize
        self.startEntry = startEntry
        self.endEntry = endEntry

        self.hdf5File = h5py.File(self.fileName, 'r')

        self.totalBatches = (self.endEntry-self.startEntry) // self.batchSize
        self.batchShape = self.hdf5File['input'][0].shape
        self.outputShape = self.hdf5File['anomalyScore'][0].shape
    
    def __len__(self):
        return self.totalBatches
    
    def __getitem__(self, index):
        start = self.startEntry + (index * self.batchSize)
        end = self.startEntry + ((index+1) * self.batchSize)

        batch_data = self.hdf5File['input'][start:end]
        batch_output = self.hdf5File['anomalyScore'][start:end]

        return batch_data, batch_output

    def on_epoch_end(self):
        pass

    def __del__(self):
        self.hdf5File.close()

def main(args):

    with h5py.File(args.inputFile) as theFile:
        totalEntries = len(theFile['anomalyScore'])
    
    trainEntries = math.floor(0.7*totalEntries)
    valEntries = math.floor(0.2*totalEntries)
    testEntries = math.floor(0.1*totalEntries)

    trainSequence = miniCICADAInputSequence(
        fileName=args.inputFile,
        batchSize=3200,
        startEntry=0,
        endEntry=trainEntries
    )

    valSequence = miniCICADAInputSequence(
        fileName=args.inputFile,
        batchSize=3200,
        startEntry=trainEntries+1,
        endEntry=trainEntries+1+valEntries
    )

    testEntries=miniCICADAInputSequence(
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

    # model = keras.models.Sequential([
    #     keras.layers.Input(shape=train_input.shape[1:]),
    #     keras.layers.BatchNormalization(),
    #     keras.layers.Dropout(0.2),
        
    #     keras.layers.Dense(128),
    #     keras.layers.PReLU(),
    #     keras.layers.BatchNormalization(),
    #     keras.layers.Dropout(0.2),

    #     keras.layers.Dense(64),
    #     keras.layers.PReLU(),
    #     keras.layers.BatchNormalization(),
    #     keras.layers.Dropout(0.2),

    #     keras.layers.Dense(64),
    #     keras.layers.PReLU(),
    #     keras.layers.BatchNormalization(),
    #     keras.layers.Dropout(0.2),

    #     keras.layers.Dense(1, activation='softplus')
    # ])

    model = keras.models.Sequential([
        keras.layers.Input(shape=trainSequence.batchShape),
        keras.layers.BatchNormalization(),
        
        keras.layers.Dense(1024),
        keras.layers.PReLU(),
        keras.layers.BatchNormalization(),
        keras.layers.Dropout(0.4),
        
        keras.layers.Dense(704),
        keras.layers.PReLU(),
        keras.layers.BatchNormalization(),
        keras.layers.Dropout(0.4),

        #keras.layers.ActivityRegularization(l2=0.002),

        keras.layers.Dense(32),
        keras.layers.PReLU(),
        keras.layers.BatchNormalization(),

        keras.layers.Dropout(0.3),

        keras.layers.Dense(1, activation="softplus")
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
            trainSequence,
            epochs=20,
            validation_data=valSequence,
            #steps_per_epoch = 1000,
            #validation_steps = 1000,
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


if __name__ == '__main__':
    parser =argparse.ArgumentParser(description='Perform a miniCICADA training')
    parser.add_argument('--inputFile', nargs='?',help='hdf5 file to build a sequence from')

    args = parser.parse_args()
    main(args)
