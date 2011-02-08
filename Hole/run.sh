#!/bin/sh
# $Id: run.sh,v 1.3 2011-01-29 17:58:29 kmo Exp $

runSplineSol Hole0-p1.inp -vtf 1
runSplineSol Hole1-p1.inp -vtf 1
runSplineSol Hole2-p1.inp -vtf 1
runSplineSol Hole3-p1.inp -vtf 1
runSplineSol Hole4-p1.inp -vtf 1
awk -f ../error.awk Hole?-p1.log > Hole-p1.err
runSplineSol Hole1-p2.inp -vtf 1 -nu 3 -nv 3
runSplineSol Hole2-p2.inp -vtf 1 -nu 3 -nv 3
runSplineSol Hole3-p2.inp -vtf 1 -nu 3 -nv 3
runSplineSol Hole4-p2.inp -vtf 1 -nu 3 -nv 3
runSplineSol Hole1-p3.inp -vtf 1 -nu 4 -nv 4
runSplineSol Hole2-p3.inp -vtf 1 -nu 4 -nv 4
runSplineSol Hole3-p3.inp -vtf 1 -nu 4 -nv 4
runSplineSol Hole4-p3.inp -vtf 1 -nu 4 -nv 4
runSplineSol Hole2D0-p1.inp -vtf 1 -2D
runSplineSol Hole2D1-p1.inp -vtf 1 -2D
runSplineSol Hole2D2-p1.inp -vtf 1 -2D
runSplineSol Hole2D3-p1.inp -vtf 1 -2D
runSplineSol Hole2D4-p1.inp -vtf 1 -2D
awk -f ../error.awk Hole2D?-p1.log > Hole2D-p1.err
runSplineSol -prefix Lagrange- Hole2-p2.inp -vtf 1 -lag
runSplineSol -prefix Spectral- Hole2-p2.inp -vtf 1 -spec
runSplineSol -prefix Lagrange- Hole2D2-p1.inp -vtf 1 -2D -lag
runSplineSol -prefix Spectral- Hole2D2-p1.inp -vtf 1 -2D -spec
