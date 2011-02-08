#!/bin/sh
# $Id: run1P.sh,v 1.5 2009-06-14 12:43:12 kmo Exp $
export PATH=$PATH:$HOME/ICADA/bin
prefix=StiffPanel1_free_$1
shift
for file in ${prefix}_h?.inp; do
runSplineSol -noref $file $* -vtf 1 -nviz 3 -eig 4 -shift 1.0 -nev 16
done
awk -f ../freq.awk ${prefix}_h?.log > $prefix.freq
awk -f ../eigv.awk ${prefix}_h?.log > $prefix.eig
