#!/bin/sh
#PBS -l nodes=1:ppn=32
#PBS -l mem=400gb
#PBS -l walltime=200:00:00

project=HEG4_RAW.2

cd /rhome/cjinfeng/Rice/Assembly/HEG4_cjinfeng/ALLPATH_LG
date
./assemble.$project.sh
date
echo "Done"

