#!/bin/bash
set -e

#Export path to kraken db:
export KRAKEN2_DB_PATH="minikraken_8GB_202003" # add the full directory if you are using different path
wait

#Run Kraken paired end:
kraken2 --threads 10 --db minikraken_8GB_20200312 --report kraken_report.txt --gzip-compressed --paired sample_R1.fastq.gz sample_R2.fastq.gz > kraken_data.tsv

#or

#Run Kraken single end:
#kraken2 --threads 10 --db minikraken_8GB_20200312 --report kraken_report.txt --gzip-compressed sample_R1.fastq.gz > kraken_data.tsv

wait

#Create kraken html report:
ktImportTaxonomy -s 3 -t 4 -o kraken_summary.html kraken_data.tsv

#use kraken tools to extract reads belonging to specific taxid , help: https://ccb.jhu.edu/software/krakentools/index.shtml?t=extractreads
