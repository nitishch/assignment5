#!/bin/bash
i=1
while [ $i -lt 7 ]
do
	j=1
	while [ $j -lt 151 ]
	do
		../mybins/cs296_28_exe $i > ../data/g28out-${i}-${j}.txt
		j=$(($j+1))
	done
		i=$(($i+1))
done
