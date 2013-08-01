#!/bin/sh
#PBS -l nodes=1:ppn=32
#PBS -l mem=100gb
#PBS -l walltime=300:00:00

project=chr01_2

cd /rhome/cjinfeng/Rice/Assembly/HEG4_cjinfeng/ALLPATH_LG
date
./update.$project.sh
date
echo "Done"

