#!/bin/bash

# This is a script to calculate LD proxies for every snp in a snpList for a single chromosome from a 1000 Genomes
# reference genome in PLINK binary format (.bed, .bim, .fam).

# **Make sure snpLists and GWAS summary statistics are split by chromosome**

# Run with the following: ./LDproxies.sh <snpList> <chr of snps> <assembly> <basename of plink files w/o chromosome> <r2> <kb_window_size> <ld_window>
# Included defaults are:
#	-kb_window_size = 1000
#	-r2 = 0.8
#   -ld_window = 200000
# Example usage: ./LDproxies.sh /path/to/snpList.txt 1 GRCh38 1000G.GRCh38.20181129_chr

snpList=$1
## To grab a snpList from the second column of a file: snpList=`awk '{print $2}' ${snpList}`  
chr=$2
refFile=/proj/phanstiel_lab/SHARE/genomes/1000G/$3/$4_${chr}

r2=${5:-0.8}
window_kb=${6:-1000}
ld_window=${7:-200000}

module load plink

for snp in ${snpList}
do
	jid=`sbatch -t 2:00:00 --mem=5g --wrap="plink --bfile ${refFile} --ld-snp ${snp} --ld-window ${ld_window} --ld-window-kb ${window_kb} --ld-window-r2 ${r2} --r2 --out ${snp}_${window_kb}kb_${r2}"`
done
