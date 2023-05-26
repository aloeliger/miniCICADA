#!/usr/bin/bash

for ((i = 2; i <= 7; i++)); do
    crab submit -c "miniCICADA/python/crabConfigs/crabConfig_EZB${i}.py"
done