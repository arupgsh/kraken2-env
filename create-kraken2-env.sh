#!/bin/bash
set -e

#Download kraken databse
wget -4 ftp://ftp.ccb.jhu.edu/pub/data/kraken2_dbs/minikraken_8GB_202003.tgz ## Use IPV4
wait
tar -xvf minikraken_8GB_202003.tgz
wait

#Create the conda environment
conda env create -f kraken2-env.yml
wait
conda activate kraken2-env
wait

#Update krona taxonomy database

echo "This might take some time"

bash ${CONDA_PREFIX}/opt/krona/updateTaxonomy.sh 
wait
bash ${CONDA_PREFIX}/envs/kraken2-env/opt/krona/updateAccessions.sh

