echo "preparing data"
qsub -q batch -l nodes=1:ppn=1,mem=10gb runprepare.sh
qsub -q highmem -l nodes=1:ppn=1,mem=100gb runprepare.sh

echo "assembly data"
qsub -q highmem runassembly.sh

echo "summary time usage in assembly"
echo "HEG4, use default"
perl sumALLPATHprocess.pl --log ./HEG4/make_log/data/run/test/2013-02-13T07:36:42/summary.log
echo "chr01"
perl sumALLPATHprocess.pl --log ./chr01/make_log/data/run/test/2013-02-09T02\:14\:12/summary.log --maxtime 200 --project chr01
echo "HEG4_RAW"
perl sumALLPATHprocess.pl --log ./HEG4_RAW/make_log/data/run/test/2013-02-17T13\:40\:55/summary.log --project HEG4_RAW --maxtime 500


echo "preparing group and lib"
find /rhome/cjinfeng/HEG4_cjinfeng/fastq/errorcorrection/soapec/*/*.* | grep ".fq$" | grep -e"_1.fq" -e"_p1.fq" > in_groups.HEG4.soapec.csv

echo "rerun allpath-lg using different coverage of reads, first need to create frag_reads_orig.fastb and jump_reads_orig.fastb"
qsub -q js runupdate.sh

