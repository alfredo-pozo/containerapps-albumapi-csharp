#!/bin/bash

keyvaultName=$1
arg2=$2

# Converting string in array
secretArray=($arg2)

# Declaring key-value array
valueArray=()

for i in "${secretArray[@]}"
do
    valueArray[${i}]=$(az keyvault secret show --vault-name ${keyvaultName} --name ${i} -o tsv --query "value")

    echo "${i}=${valueArray[$i]}" >> $GITHUB_OUTPUT
    # echo "${secretArray[${i}]}"
    # echo "${valueArray[$i]}"
done

# echo "${valueArray[@]}"
