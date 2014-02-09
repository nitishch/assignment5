#!/bin/bash
i=1
filename=dummy.txt
touch ${filename}
while [ $i -lt 7 ]
do
	j=1
	while [ $j -lt 151 ]
	do
		../mybins/cs296_28_exe $i > ${filename}
		echo -n `sed -n '1s/.*: *\(.*\)$/\1/p' ${filename}` >> ../data/g28_lab05data_02.csv
		echo -n "," >> ../data/g28_lab05data_02.csv
		echo -n ${j} >> ../data/g28_lab05data_02.csv
		echo -n "," >> ../data/g28_lab05data_02.csv
		echo -n `sed -n '2s/[a-zA-Z ]*\([0-9.]*\) ms$/\1/p' ${filename}` >> ../data/g28_lab05data_02.csv
		echo -n "," >> ../data/g28_lab05data_02.csv
		echo -n `sed -n '3s/[a-zA-Z ]*\([0-9.]*\) ms$/\1/p' ${filename}` >> ../data/g28_lab05data_02.csv
		echo -n "," >> ../data/g28_lab05data_02.csv
		echo -n `sed -n '4s/[a-zA-Z ]*\([0-9.]*\) ms$/\1/p' ${filename}` >> ../data/g28_lab05data_02.csv
		echo -n "," >> ../data/g28_lab05data_02.csv
		echo -n `sed -n '5s/[a-zA-Z ]*\([0-9.]*\) ms$/\1/p' ${filename}` >> ../data/g28_lab05data_02.csv
		echo -n "," >> ../data/g28_lab05data_02.csv
		echo `sed -n '7s/[a-zA-Z ]*\([0-9.]*\) ms$/\1/p' ${filename}` >> ../data/g28_lab05data_02.csv
		j=$(($j+1))
	done
		i=$(($i+1))
done
rm -f ${filename}
