#!/bin/bash
#bc <<< "scale=5;"
j=73
file=../data/g28_lab05data_02.csv
touch ../data/variance.csv
while [ $j -le 73 ]
do
	steptime=0
	stepdev=0
#	colltime=0
#	veltime=0
#	postime=0
#	looptime=0
	rerun=1
	while [ $rerun -le 151 ]
	do
		line=$(((${j}-1)*150+${rerun}))
#		echo $line
		stepadder=$(echo -n $(sed -n "${line}s/^[^,]*,[^,]*,\([^,]*\),.*$/\1/p" ${file}) )
#		stepdevadder=$(echo "scale=5; ${stepadder}*${stepadder}" | bc)
#		stepadder=$(echo -n $(sed -n "$(( ($j-1)*150+${rerun} ))s/^[^,]*,[^,]*,\([^,]*\),.*$/\1/p" ${file}) )
#		colladder=$(echo -n $(sed -n "${line}s/^[^,]*,[^,]*,[^,]*,\([^,]*\),.*$/\1/p" ${file}) )
#		veladder=$(echo -n $(sed -n "${line}s/^[^,]*,[^,]*,[^,]*,[^,]*,\([^,]*\),.*$/\1/p" ${file}) )
#		posadder=$(echo -n $(sed -n "${line}s/^[^,]*,[^,]*,[^,]*,[^,]*,[^,]*,\([^,]*\),.*$/\1/p" ${file}) )
#		loopadder=$(echo -n $(sed -n "${line}s/^[^,]*,[^,]*,[^,]*,[^,]*,[^,]*,[^,]*,\([^,]*\).*$/\1/p" ${file}) )
#		echo $stepadder
#		echo $stepdevadder
#	if [ $(echo "scale=5; $colladder < 300" | bc) -eq 1 ]
#	then		
#		colltime=$(echo "scale=5; ${colltime}+${colladder}" | bc)
#	fi	
#	if [ $(echo "scale=5; $veladder < 300" | bc) -eq 1 ]
#	then		
#		veltime=$(echo "scale=5; ${veltime}+${veladder}" | bc)
#	fi	
#	if [ $(echo "scale=5; $posadder < 300" | bc) -eq 1 ]
#	then		
#		postime=$(echo "scale=5; ${postime}+${posadder}" | bc)
#	fi	
#	if [ $(echo "scale=5; $loopadder < 300" | bc) -eq 1 ]
#	then		
#		looptime=$(echo "scale=5; ${looptime}+${loopadder}" | bc)
#	fi	
	if [ $(echo "scale=5; ${stepadder} < 300" | bc) -eq 1 ]
	then
		steptime=$(echo "scale=5; ${steptime}+${stepadder}" | bc)
#		stepdev=$(echo "scale=5; ${stepdevadder}+${stepdev}" | bc)
	fi
#		echo "scale=5; ;aiwo"
		rerun=$((${rerun}+1))
	done
	
#	(( steptime = $(echo "scale=5; $steptime > 300" | bc)?$(echo "scale=5; $steptime/150" | bc):$steptime ))
#	if [ $(echo "scale=5; $steptime < 300" | bc) ]
#	then
	steptime=$(echo "scale=5; $steptime/150" | bc)
	
#	stepdev=$(echo "scale=5; sqrt((${stepdev}/150)-${steptime}*${steptime})" | bc)
#	echo $stepdev
#	fi
#	echo $steptime		
#	colltime=$(echo "scale=5; $colltime/150" | bc)
#	veltime=$(echo "scale=5; $veltime/150" | bc)
#	postime=$(echo "scale=5; $postime/150" | bc)
#	looptime=$(echo "scale=5; $looptime/150" | bc)
#	echo "$j,$steptime,$colltime,$veltime,$postime,$looptime,$stepdev" >> ../data/average.csv
	i=1
	while [ $i -lt 151 ]
	do
		stepadder=$(echo -n $(sed -n "${line}s/^[^,]*,[^,]*,\([^,]*\),.*$/\1/p" ${file}) )
		a=$(echo \"$stepadder-$steptime\" | bc)
		echo "$i,$a" >> variance.csv
		i=$(($i+1))
	done	
	j=$(($j+1))
done
