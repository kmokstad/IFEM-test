#!/bin/sh
# $Id$
if [ $# -gt 0 ]; then h=$1; else exec echo "usage: $0 <h>"; fi

runNonlinel necking-2D-$h-Q1.inp   -2D -UL -vtf 1 -nGauss 2 -outPrec 6
runNonlinel necking-2D-$h-Q1P0.inp -2D -MX 0 -vtf 1 -nGauss 2 -outPrec 6
runNonlinel Necking-2D-$h-Q1P0.inp -2D -MX 0 -vtf 1 -nGauss 2 -outPrec 6

runNonlinel necking-2D-$h-Q2.inp   -2D -UL -vtf 1 -lagrange -nGauss 3 -outPrec 6
runNonlinel necking-2D-Q2-$h.inp   -2D -UL -vtf 1 -nviz 3   -nGauss 3 -outPrec 6
runNonlinel necking-2D-$h-Q2P1.inp -2D -MX 1 -vtf 1 -lagrange -nGauss 3 -outPrec 6 
runNonlinel necking-2D-Q2P1-$h.inp -2D -MX 1 -vtf 1 -nviz 3   -nGauss 3 -outPrec 6
runNonlinel Necking-2D-Q2P1-$h.inp -2D -MX 1 -vtf 1 -nviz 3   -nGauss 3 -outPrec 6
runNonlinel necking-2D-$h-Q2Q1.inp -2D -mixed -vtf 1 -lagrange -nGauss 3 -outPrec 6
runNonlinel necking-2D-Q2Q1-$h.inp -2D -mixed -vtf 1 -nviz 3   -nGauss 3 -outPrec 6
runNonlinel Necking-2D-Q2Q1-$h.inp -2D -mixed -vtf 1 -nviz 3   -nGauss 3 -outPrec 6

runNonlinel necking-2D-$h-Q3.inp -2D -UL -vtf 1 -lagrange -nGauss 4 -outPrec 6
runNonlinel necking-2D-Q3-$h.inp -2D -UL -vtf 1 -nviz 4   -nGauss 4 -outPrec 6
runNonlinel necking-2D-$h-Q3P2.inp -2D -MX 2 -vtf 1 -lagrange -nGauss 4 -outPrec 6 
runNonlinel necking-2D-Q3P2-$h.inp -2D -MX 2 -vtf 1 -nviz 4   -nGauss 4 -outPrec 6
runNonlinel Necking-2D-Q3P2-$h.inp -2D -MX 2 -vtf 1 -nviz 4   -nGauss 4 -outPrec 6
runNonlinel necking-2D-$h-Q3Q2.inp -2D -mixed -vtf 1 -lagrange -nGauss 4 -outPrec 6
runNonlinel necking-2D-Q3Q2-$h.inp -2D -mixed -vtf 1 -nviz 4   -nGauss 4 -outPrec 6
runNonlinel Necking-2D-Q3Q2-$h.inp -2D -mixed -vtf 1 -nviz 4   -nGauss 4 -outPrec 6

runNonlinel Necking-3D-Q2Q1-$h.inp -mixed -vtf 1 -nviz 3 -nGauss 3 -outPrec 6
runNonlinel Necking-3D-Q3Q2-$h.inp -mixed -vtf 1 -nviz 4 -nGauss 4 -outPrec 6
