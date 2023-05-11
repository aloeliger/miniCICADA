import ROOT
import os

basePath = '/hdfs/store/user/aloelige'

filePaths = (
    f'{basePath}/EphemeralZeroBias2/CICADA_EphemeralZeroBias2_05May2023/',
    f'{basePath}/EphemeralZeroBias4/CICADA_EphemeralZeroBias5_05May2023/',
    f'{basePath}/EphemeralZeroBias4/CICADA_EphemeralZeroBias6_05May2023/',
    f'{basePath}/EphemeralZeroBias7/CICADA_EphemeralZeroBias7_05May2023/',
)

theFiles = []

for filePath in filePaths:
    for root, dirs, files in os.walk(filePath, topdown=True):
        for name in files:
            theFiles.append(os.path.join(root, name))
    