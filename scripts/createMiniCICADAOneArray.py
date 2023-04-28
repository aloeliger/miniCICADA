from sklearn.model_selection import train_test_split
import h5py
import os
import numpy as np
from tensorflow import keras

if __name__ == '__main__':
    theFiles = []
    for root, dirs, files in os.walk('testHDF5',topdown=True):
        for name in files:
            theFiles.append(os.path.join(root,name))

    input = None
    output = None
    for index, name in enumerate(theFiles):
        with h5py.File(name) as theFile:
            if index == 0:
                input = np.array(theFile['input'])
                output = np.array(theFile['output'])
            else:
                input = np.append(input, np.array(theFile['input']), axis=0)
                output = np.append(output, np.array(theFile['output']), axis=0)
    print(input.shape)
    print(output.shape)

    train_input, val_input, train_output, val_output = train_test_split(input, output, train_size=0.7, random_state=1234)

    batchShape=train_input.shape

    print(batchShape)

    model = keras.models.Sequential([
        keras.layers.InputLayer(input_shape=[batchShape[1]]),
        keras.layers.BatchNormalization(),
        keras.layers.Dense(100),
        keras.layers.ReLU(),
        keras.layers.Dropout(0.3),
        keras.layers.Dense(75),
        keras.layers.ReLU(),
        keras.layers.Dense(50),
        keras.layers.ReLU(),
        keras.layers.Dense(1)
    ])

    model.compile(
        loss='mse',
        optimizer='nadam',
        metrics=[keras.metrics.RootMeanSquaredError()],
    )

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

    model.fit(
        x=train_input,
        y=train_output,
        epochs=100,
        validation_data=(val_input, val_output),
        #steps_per_epoch = 1000,
        #validation_steps = 100,
        callbacks = [
            checkpointCallback,
            LRScheduler,
            nanTermination,
        ],
        #workers=4,
        #use_multiprocessing=True
    )