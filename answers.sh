#! /usr/bin/env bash

mydataset='/home/dalgarno/Documents/GAW/data-sets'

mydata1='/misc/states.tab.gz'
myanswer1=$(zcat $mydataset$mydata1 \
	| grep -v "^#" \
	| cut -f 1,6 \
	| sort -k2n \
	| cut -f 1 \
	| head -n 1) 
echo Answer 1:  $myanswer1 

mydata2='/fasta/sample.fa'
myanswer2=$(grep -c '>' $mydataset$mydata2)
	
echo Answer 2: $myanswer2

mydata3='/bed/cpg.bed.gz'
# wc -l returns number of lines
myanswer3=$(zcat $mydataset$mydata3 \
	| cut -f 4 \
	| sort \
	| uniq \
	| wc -l)

echo Answer 3: $myanswer3

mydata4='/fastq/SP1.fq'
# grep -c enumerates matches
myanswer4=$(grep -c '^@cluster' $mydataset$mydata4)

echo Answer 4: $myanswer4

mydata5='/misc/hamlet.txt'
myanswer5=$(grep 'bloody' $mydataset$mydata5 \
	| wc -w)

echo Answer 5: $myanswer5

mydata6='/fasta/sample.fa'
# sed -n returns line at indices. many 
# informaticians emphasize use of awk
# sed and grep for parsing fastas via 
# bash. must "level up" my regex skills.
myanswer6=$(sed -n '2p' $mydataset$mydata6 \
	| wc -m)

echo Answer 6: $myanswer6

mydata7='/bed/genes.hg19.bed.gz'
myanswer7=$(zcat $mydataset$mydata7 \
	| awk 'BEGIN {OFS="\t"} {print $0, $3 - $2}' \
	| sort -k7nr \
	| head -n 1 \
	| cut -f 4) 

echo Answer 7: $myanswer7

myanswer8=$(zcat $mydataset$mydata7 \
	| cut -f 1 \
	| sort -u \
	| wc -l)

echo Answer 8: $myanswer8 

mydata9='/bed/peaks.chr22.bed.gz'
myanswer9=$(zcat $mydataset$mydata9 \
	| grep -w CTCF \
	| wc -l)

echo Answer 9: $myanswer9

mydata10='/bed/lamina.bed'
myanswer10=$(cat $mydataset$mydata10 \
	| grep -v "^#" \
	| awk 'BEGIN {OFS="\t"} {print $1, $3 - $2}' \
	| sort -k2rn \
	| head -n 1 \
	| cut -f 1)

echo Answer 10: $myanswer10
