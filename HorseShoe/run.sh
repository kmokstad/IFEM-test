#!/bin/sh
# $Id: run.sh,v 1.2 2009-11-04 14:12:10 kmo Exp $

runSplineSol HorseShoe1.inp -vtf 1 -nviz 9
runSplineSol HorseShoe2.inp -vtf 1 -nviz 5
runSplineSol HorseShoe3.inp -vtf 1 -nviz 3
runSplineSol -prefix free- HorseShoe1.inp -eig 4 -shift 1.0 -free -vtf 1 -nviz 9
runSplineSol -prefix free- HorseShoe2.inp -eig 4 -shift 1.0 -free -vtf 1 -nviz 5
runSplineSol -prefix free- HorseShoe3.inp -eig 4 -shift 1.0 -free -vtf 1 -nviz 3
