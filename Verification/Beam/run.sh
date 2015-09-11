#!/bin/sh
for file in $1-??.xinp; do echo $file:
./runConv.sh $file | sed '/ 0 *$/d' | tee `basename $file .xinp`.dat
done
if [ -e $1.gpl ]; then gnuplot $1.gpl; fi
