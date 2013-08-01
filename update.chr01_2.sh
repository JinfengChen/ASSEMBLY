#!/bin/sh

# ALLPATHS-LG needs 100 MB of stack space.  In 'csh' run 'limit stacksize 100000'.
ulimit -s 100000

project=chr01_2
gsize=40000000
mkdir -p $project/data

PATH=/opt/allpathslg/41554/bin/:$PATH

# NOTE: The option GENOME_SIZE is OPTIONAL. 
#       It is useful when combined with FRAG_COVERAGE and JUMP_COVERAGE 
#       to downsample data sets.
#       By itself it enables the computation of coverage in the data sets 
#       reported in the last table at the end of the preparation step. 

# NOTE: If your data is in BAM format you must specify the path to your 
#       picard tools bin directory with the option: 
#
#       PICARD_TOOLS_DIR=/your/picard/tools/bin

## reads already cached in data/read_cache, now generate jump_reads_orig and frag_reads_orig for assembly
CacheToAllPathsInputs.pl\
    CACHE_DIR=$PWD/$project/data/read_cache \
    PLOIDY=2 IN_GROUPS_CSV=in_groups.$project.csv                               \
    DATA_DIR=$PWD/$project/data \
    GENOME_SIZE=$gsize FRAG_COVERAGE=120 FRAG_FRAC= JUMP_COVERAGE= JUMP_FRAC=   \
    LONG_JUMP_COVERAGE= LONG_JUMP_FRAC= LONG_JUMP_MIN_SIZE=20000               \
    LONG_READ_COVERAGE= LONG_READ_FRAC= LONG_READ_MIN_LEN=500 DRY_RUN=0        \
    VERBOSE=1 \
    | tee update.$project.out


