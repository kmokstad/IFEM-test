#!/bin/sh
# $Id$
# Extract some data from the log-files for plotting.
# The results of the final state are tabulated to the console.

if [ $# -lt 1 ]; then exec echo "usage: $0 <log-files>"; fi

echo "#Element type\tNDOF\tReact\tDispl"
for file in $*; do
awk -F= '/time/{t=$3};/(R,u)/{R=$2/t};/sol1/{print t,R,$2}' $file |\
awk 'BEGIN{print "# time reac disp"};{print $1,-$2,-$3}' >\
`basename $file .log`.dat
if grep -q Lagrange $file; then type="Lagrange"; else type="Splines ";fi
form=`basename $file .log | sed 's/.*-Q/Q/;s/-h.//'`
ndof=`awk '/Number of unknowns/{print$4}' $file`
echo -n "$type $form\t$ndof\t"
tail -1 `basename $file .log`.dat | awk '{printf"%g\t%g\n",$2,$3}'
done
