#!/bin/sh
# $Id$
# Adaptive mesh refinement simulation for Kirchhoff-Love problems.

input=`basename $1 .inp`
if [ ! -f $input.inp ]; then exec echo "usage: $0 <inputfile> [<ng>] [<nv>]"; fi
if [ $# -gt 1 ]; then ng=$2; else ng=4; fi
if [ $# -gt 2 ]; then nv=$3; else nv=2; fi

output=${input}_AMR
LinEl $input.inp -nGauss $ng -KL -adap -vtf 1 -nviz $nv | tee $output.log |\
egrep 'Adaptive|Number of elements|Exact relative'

awk '/Number of unknowns/{ndof=$4};/Exact relative/{print ndof,$6}' $output.log > $output.dat
echo "\nDone. Resulting errors (stored in $output.dat):"
cat $output.dat
