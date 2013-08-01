#!/bin/sh

# ALLPATHS-LG needs 100 MB of stack space.  In 'csh' run 'limit stacksize 100000'.
ulimit -s 100000

mkdir -p chr01/data

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
 DATA_DIR=$PWD/chr01/data\
 PLOIDY=1\
 IN_GROUPS_CSV=in_groups.csv\
 IN_LIBS_CSV=in_libs.csv\
 GENOME_SIZE=40000000\
 OVERWRITE=True\
 | tee prepare.out 

