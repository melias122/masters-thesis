#!/bin/bash

# 2000 439 50000 100 A
for i in 10000 50000; do
    for p in 10 20 50 100; do
    	for s in A B C D E F G H I J; do

	file=${i}_${p}_${s}
	echo -n "" > $file
	
    	for j in `seq 50 50 2000`; do
    	    grep -E "^${j} [0-9]+ $i $p ${s}$" orig.data | awk '{ sum += $2 } END { print $1, (sum/NR)/$1 }' >> $file
	done

	done
    done
done
