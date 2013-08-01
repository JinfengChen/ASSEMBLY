#!/bin/sh

# ALLPATHS-LG needs 100 MB of stack space.  In 'csh' run 'limit stacksize 100000'.
ulimit -s 100000

project=HEG4_RAW.2
gsize=400000000
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

PrepareAllPathsInputs.pl\
 DATA_DIR=$PWD/$project/data\
 PLOIDY=2\
 IN_GROUPS_CSV=in_groups.$project.csv\
 IN_LIBS_CSV=in_libs.$project.csv\
 GENOME_SIZE=$gsize\
 OVERWRITE=True\
 | tee prepare.$project.out 

