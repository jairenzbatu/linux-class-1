#!/bin/bash

echo "Input Code"
read hello

decode=$(echo ${hello} | base64 -d)
echo -e ${decode}