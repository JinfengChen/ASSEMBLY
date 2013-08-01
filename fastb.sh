#!/bin/sh

ulimit -s 100000

PATH=/opt/allpathslg/41554/bin/:$PATH

cd /rhome/cjinfeng/Rice/Assembly/HEG4_cjinfeng/ALLPATH_LG/chr01
 
Fasta2Fastb IN=genome.fasta OUT=genome.fastb > log 2> log2


