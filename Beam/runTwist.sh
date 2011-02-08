#!/bin/sh
# $Id: runTwist.sh,v 1.1 2010-07-01 09:54:54 kmo Exp $

runNonlinel ColumnTwist-p1.inp -vtf 1 -nGauss 2
runNonlinel ColumnTwist-p2.inp -vtf 1 -nGauss 3 -nviz 3
runNonlinel ColumnTwist-p3.inp -vtf 1 -nGauss 4 -nviz 4
runNonlinel ColumnTwist8-p1.inp -vtf 1 -nGauss 2 -lag
