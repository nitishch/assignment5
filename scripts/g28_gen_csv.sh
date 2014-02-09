#!/bin/bash
touch ../data/g28_lab05data_01.csv
rerunno=0
for j in $(ls ../data/*.txt)
do
	echo -n `sed -n '1s/.*: *\([0-9.]*\)$/\1/p' $j` >> ../data/g28_lab05data_01.csv
	echo -n "," >> ../data/g28_lab05data_01.csv
	echo -n $((${rerunno}%150+1)) >> ../data/g28_lab05data_01.csv
	echo -n "," >> ../data/g28_lab05data_01.csv
	echo -n `sed -n '2s/[a-zA-Z ]*\([0-9.]*\) ms$/\1/p' $j` >> ../data/g28_lab05data_01.csv
	echo -n "," >> ../data/g28_lab05data_01.csv
	echo -n `sed -n '3s/[a-zA-Z ]*\([0-9.]*\) ms$/\1/p' $j` >> ../data/g28_lab05data_01.csv
	echo -n "," >> ../data/g28_lab05data_01.csv
	echo -n `sed -n '4s/[a-zA-Z ]*\([0-9.]*\) ms$/\1/p' $j` >> ../data/g28_lab05data_01.csv
	echo -n "," >> ../data/g28_lab05data_01.csv
	echo -n `sed -n '5s/[a-zA-Z ]*\([0-9.]*\) ms$/\1/p' $j` >> ../data/g28_lab05data_01.csv
	echo -n "," >> ../data/g28_lab05data_01.csv
	echo `sed -n '7s/[a-zA-Z ]*\([0-9.]*\) ms$/\1/p' $j` >> ../data/g28_lab05data_01.csv
	rerunno=$((${rerunno}+1))
done
