#!/bin/sh
# $Id: run.sh,v 1.3 2009-11-03 09:52:38 kmo Exp $

for file in square_p1_h?.inp; do
runSplineSol $file -nGauss 2 -eig 5 -shift 1.0e-4 -vtf 1
done

nv=3
for file in square_p2_h?.inp; do
prefix=`basename $file .inp`
if [ "$prefix" = "square_p2_h3" ]; then nv=2; fi
runSplineSol -prefix free- $file -nGauss 3 -eig 4 -free -nev 16 -ncv 32 -shift -1 -vtf 1 -nu $nv -nv $nv
runSplineSol $file -nGauss 3 -eig 5 -nev 20 -ncv 40 -shift 1.0e-4 -vtf 1 -nu $nv -nv $nv
done
