#!/bin/sh
# $Id$
# Uniform mesh refinement simulation for Kirchhoff-Love problems.

input=`basename $1 .inp`
nstep=$2
if [ ! -f $input.inp -o $# -lt 2 ]; then exec echo "usage: $0 <inputfile> <nstep> [<ng>] [<nv>]"; fi

output=${input}_UMR
if [ -f $output.log ]; then rm $output.log; fi
touch $output.log
ru=`awk '/extra knots/{print$2}' $input.inp`
rv=`awk '/extra knots/{print$3}' $input.inp`

if [ $# -gt 2 ]; then ng=$3; else ng=4; fi
if [ $# -gt 3 ]; then nv=$4; else nv=2; fi

istep=0
while [ $istep -lt $nstep ]; do
  istep=$((istep+1))
  if [ $istep -gt 1 ]; then
    ru=$((2*(ru+1)-1))
    rv=$((2*(rv+1)-1))
    sed "/extra knots/s/1  *[0-9][0-9]*  *[0-9][0-9]*/1 $ru $rv/" $input.inp > tmp.inp
  else cp $input.inp tmp.inp; fi
  echo "Running $input $((ru+1)) $((rv+1)) elements"
  LinEl tmp.inp -nGauss $ng -KL -vtf 1 -nviz $nv >> $output.log
  mv tmp.vtf ${input}_$((ru+1))_$((rv+1)).vtf
done

rm tmp.inp
awk '/Number of unknowns/{ndof=$4};/Exact relative/{print ndof,$6}' $output.log > $output.dat
echo "\nDone. Resulting errors (stored in $output.dat):"
cat $output.dat
