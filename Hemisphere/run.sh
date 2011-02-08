#!/bin/sh
# $Id: run.sh,v 1.3 2010-03-09 08:17:44 kmo Exp $

cd ./Coarse
runSplineSol HemisphereC.inp -vtf 1 -nviz 9
runSplineSol HemisphereC-free.inp -eig 4 -shift 0.01 -vtf 1 -nviz 9

cd ../Quintic
runSplineSol HemisphereQ.inp -vtf 1 -nviz 3
runSplineSol HemisphereQ-free.inp -eig 4 -shift 0.01 -vtf 1 -nviz 3

cd ../GPMtest
runSplineSol HemisphereC.inp -vtf 1 -nviz 9
runSplineSol HemisphereC1.inp -vtf 1 -nviz 9
runSplineSol Hemisphere.inp -vtf 1 -nviz 3
