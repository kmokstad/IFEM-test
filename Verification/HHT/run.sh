#!/bin/sh
case=`basename $1 .xinp`
if [ ! -e $case.xinp ]; then exec echo "usage: $0 <inputfile>"; fi
DynamicEl $1 -1D -TL -outPrec 12 | tee $case.log |\
sed 's/=/ /g' | awk -f getData.awk | tee $case.dat
