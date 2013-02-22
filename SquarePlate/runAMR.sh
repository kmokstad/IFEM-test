#!/bin/sh
# $Id$
# Adaptive mesh refinement simulation for Kirchhoff-Love problems.

input=`basename $1 .inp`
if [ ! -f $input.inp ]; then exec echo "usage: $0 <inputfile> [<ng>] [<nv>]"; fi
if [ -z `which LinEl` ]; then exec echo "No program 'LinEl' in $PATH"; fi

if [ $# -gt 1 ]; then shift; ng="-nGauss $1"; fi
if [ $# -gt 1 ]; then shift; nv="-nviz $1"; fi
shift

output=${input}_AMR
LinEl $input.inp $ng -KL -adap1 -vtf 1 $nv $* | tee $output.log |\
egrep 'Adaptive|Number of elements|Exact relative'

awk '/Number of unknowns/{ndof=$4};/Exact relative/{exa=$6};/Relative error/{est=$5};/RMS/{print ndof,exa,est}' $output.log > $output.dat
echo "\nDone. Resulting errors (stored in $output.dat):"
cat $output.dat
