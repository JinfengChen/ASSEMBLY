#!/bin/sh

# ALLPATHS-LG needs 100 MB of stack space.  In 'csh' run 'limit stacksize 100000'.
ulimit -s 100000

project=chr01_2

PATH=/opt/allpathslg/41554/bin/:$PATH

RunAllPathsLG \
 PRE=$PWD\
 REFERENCE_NAME=$project\
 DATA_SUBDIR=data\
 RUN=run3\
 SUBDIR=test\
 TARGETS=standard\
 OVERWRITE=True\
 THREADS=32\
 HAPLOIDIFY=True\
 MAX_MEMORY_GB=400G\
 | tee -a assemble.$project.3.out

