#!/bin/bash

# 750 6 745 50 E b 10000
for i in 3 5 11; do
    for p in 10 20 50 100; do
    	for s in J C E; do
	    for t in b d e f; do
		for mt in 1000 5000 10000; do

		infile=raw/pga_${i}_${t}.stdout
		file=${s}_${p}_${t}_${i}_${mt}.data
		echo -n "" > $file

		if [ ! -f $infile ]; then
		    echo "file $infile not found"
		    continue
		fi
		
    	for j in `seq 50 50 2000`; do
		    grep -E "^${j} [0-9]+ [0-9]+ ${p} ${s} . ${mt}$" $infile | awk '{print $1,$3/$1}' >> $file
		done

		done
	    done
	done
    done
done
