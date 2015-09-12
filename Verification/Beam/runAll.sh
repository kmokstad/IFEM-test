#!/bin/sh
for file in *.gpl; do echo "\nRunning $file"
./run.sh `basename $file .gpl`
done
