#!/bin/sh
# $Id: run.sh,v 1.1 2010-05-14 12:46:29 kmo Exp $

runSplineSol Lshape.inp -vtf 1
runSplineSol Lshape2D0-p1.inp -vtf 1 -2D
runSplineSol Lshape2D1-p1.inp -vtf 1 -2D
runSplineSol Lshape2D2-p1.inp -vtf 1 -2D
runSplineSol Lshape2D3-p1.inp -vtf 1 -2D
runSplineSol Lshape2D4-p1.inp -vtf 1 -2D
awk -f ../error.awk Lshape2D?-p1.log > Lshape2D-p1.err
runSplineSol Lshape2D0-p2.inp -vtf 1 -2D
runSplineSol Lshape2D1-p2.inp -vtf 1 -2D
runSplineSol Lshape2D2-p2.inp -vtf 1 -2D
runSplineSol Lshape2D3-p2.inp -vtf 1 -2D
runSplineSol Lshape2D4-p2.inp -vtf 1 -2D
awk -f ../error.awk Lshape2D?-p2.log > Lshape2D-p2.err
