#!/bin/bash
directory=$1

for dir in `ls ${directory}`
do
    cd ${directory}/${dir}/fastq
    cp checksum/* ./
    # Perform checksum for all reads
    for fq in `find . -type f -iname "*.fastq.gz"`
    do
        # Get read name
        readName=`echo ${fq/.fastq.gz/ }`
        
        # Perform checksums
        md5sum -c ${fq}.md5 > checksum/$readName.checksums

        # Delete original copied over checksums
        rm ${fq}.md5

    done
done







