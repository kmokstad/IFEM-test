#!/bin/sh
# $Id: runNL.sh,v 1.2 2010-08-19 13:56:58 kmo Exp $

runNonlinel CanTSnl-p1-h1.inp -vtf 1 -nGauss 2
runNonlinel CanTSnl-p1-h2.inp -vtf 1 -nGauss 2
runNonlinel CanTSnl-p1-h3.inp -vtf 1 -nGauss 2
runNonlinel CanTSnl-p1-h4.inp -vtf 1 -nGauss 2
runNonlinel CanTSnl-p2-h1.inp -vtf 1 -nGauss 3 -nviz 3
runNonlinel CanTSnl-p2-h2.inp -vtf 1 -nGauss 3 -nviz 3
runNonlinel CanTSnl-p2-h3.inp -vtf 1 -nGauss 3 -nviz 3
runNonlinel CanTSnl-p2-h4.inp -vtf 1 -nGauss 3 -nviz 3
runNonlinel CanTSnl-p3-h1.inp -vtf 1 -nGauss 4 -nviz 3
runNonlinel CanTSnl-p3-h2.inp -vtf 1 -nGauss 4 -nviz 3
runNonlinel CanTSnl-p3-h3.inp -vtf 1 -nGauss 4 -nviz 3
runNonlinel CanTSnl-p3-h4.inp -vtf 1 -nGauss 4 -nviz 3
