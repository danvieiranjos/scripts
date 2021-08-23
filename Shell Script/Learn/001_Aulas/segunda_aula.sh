#!/bin/bash
#
#Esse programa fala sobre subshell e substituicao de comandos

#Mudar de diretorio e criar um arquivo

cd /tmp
touch arquivo1
ls -l /tmp/arquivo1
pwd

DATA=$(date +%m-%y)
echo ${DATA}
touch arquivo-${DATA}.txt
