#!/bin/sh
# $Id: runF.sh,v 1.1 2009-11-04 15:36:01 kmo Exp $

nv=3
for file in fHole?-p2.inp; do
if [ "$file" = "fHole3_p2.inp" ]; then nv=2; fi
runSplineSol $file -nGauss 3 -eig 4 -nev 16 -ncv 32 -shift -1.0 -vtf 1 -nu $nv -nv $nv
done
