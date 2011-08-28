#!/bin/sh
# $Id$
runNonlinel Cook2D-p1-h1.inp -2D -Fbar 1 -nGauss 2 -vtf 1 -nviz 3 -outPrec 6
runNonlinel Cook2D-p2-h1.inp -2D -Fbar 2 -nGauss 3 -vtf 1 -nviz 3 -outPrec 6
runNonlinel Cook2D-h1-p2.inp -2D -Fbar 2 -nGauss 3 -vtf 1 -lagrange -outPrec 6
runNonlinel -prefix Q2P1_ Cook2D-h1-p2.inp -2D -MX 1 -nGauss 3 -lagrange -outPrec 6

runNonlinel Cook3D-p1-h1.inp -Fbar 1 -nGauss 2 -vtf 1 -nu 3 -nv 3 -outPrec 6
runNonlinel Cook3D-p2-h1.inp -Fbar 2 -nGauss 3 -vtf 1 -nu 3 -nv 3 -outPrec 6
runNonlinel Cook3D-h1-p2.inp -Fbar 2 -nGauss 3 -vtf 1 -lagrange -outPrec 6
runNonlinel -prefix Q2P1_ Cook3D-h1-p2.inp -MX 1 -nGauss 3 -lagrange -outPrec 6
