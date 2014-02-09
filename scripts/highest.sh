#!/bin/bash
file=../data/g28_lab05data_02.csv
output=../data/highest.csv
i=1
target=5
while [ $i -le 150 ]
do
	echo $(sed -n "$(((${target}-1)*150+${i}))s/^\(.*\)/\1/p" ${file}) >> $output
	i=$(($i+1))
done
