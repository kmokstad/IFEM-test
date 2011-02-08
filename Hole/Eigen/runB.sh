#!/bin/sh
# $Id: runB.sh,v 1.5 2011-02-04 16:09:47 kmo Exp $

nv=3
for file in bHole?-p2.inp; do
if [ "$file" = "bHole3_p2.inp" ]; then nv=2; fi
runSplineSol $file -nGauss 3 -eig 5 -nev 15 -ncv 30 -shift 1.0e-4 -vtf 1 -nu $nv -nv $nv
done
awk -f ../../buckl.awk bHole?-p2.log > bHole-p2.eig
