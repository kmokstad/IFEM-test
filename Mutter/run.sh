#!/bin/sh
# $Id: run.sh,v 1.2 2010-04-20 09:54:54 kmo Exp $

runSplineSol mutter-h1.inp -eig 4 -nev 16 -ncv 32 -checkRHS -vtf 1 -nviz 9
runSplineSol mutter-h2.inp -eig 4 -nev 16 -ncv 32 -checkRHS -vtf 1 -nviz 5
runSplineSol mutter-h3.inp -eig 4 -nev 16 -ncv 32 -checkRHS -vtf 1 -nviz 3
runSplineSol mutter-h1-Pressure.inp -checkRHS -vtf 1 -nviz 3
runSplineSol mutter8-h1-pressure.inp -checkRHS -vtf 1 -nviz 3
runSplineSol mutter26-h1.inp -eig 4 -nev 16 -ncv 32 -checkRHS -vtf 1 -nviz 9
runSplineSol mutter26-h1-Pressure.inp -checkRHS -vtf 1 -nviz 3
