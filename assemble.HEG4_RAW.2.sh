#!/bin/sh

# ALLPATHS-LG needs 100 MB of stack space.  In 'csh' run 'limit stacksize 100000'.
ulimit -s 100000

project=HEG4_RAW.2

PATH=/opt/allpathslg/41554/bin/:$PATH

RunAllPathsLG \
 PRE=$PWD\
 REFERENCE_NAME=$project\
 DATA_SUBDIR=data\
 RUN=run\
 SUBDIR=test\
 TARGETS=standard\
 OVERWRITE=True\
 THREADS=32\
 MAX_MEMORY_GB=400G\
 | tee -a assemble.$project.out

