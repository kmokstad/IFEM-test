#!/bin/sh
# $Id: run.sh,v 1.4 2009-09-15 07:34:10 kmo Exp $

cd P2
runSplineSol Cylinder1P2.inp -checkRHS -vtf 1 -nviz 9
runSplineSol Cylinder2P2.inp -checkRHS -vtf 1 -nviz 5
runSplineSol Cylinder3P2.inp -checkRHS -vtf 1 -nviz 3
runSplineSol Cylinder4P2.inp -checkRHS -vtf 1
#runSplineSol Cylinder6P2.inp -checkRHS -vtf 1
#runSplineSol Cylinder5P2.inp -checkRHS -samg -vtf 1
runSplineSol Cylinder4P2_eig.inp -checkRHS -vtf 1 -eig 4 -nev 16 -shift 1.0

cd ../P3
runSplineSol Cylinder1P3.inp -checkRHS -superlu -vtf 1 -nviz 9
runSplineSol Cylinder2P3.inp -checkRHS -superlu -vtf 1 -nviz 5
runSplineSol Cylinder3P3.inp -checkRHS -superlu -vtf 1 -nviz 3
#runSplineSol Cylinder4P3.inp -checkRHS -superlu -vtf 1
#runSplineSol Cylinder5P3.inp -checkRHS -superlu -vtf 1
runSplineSol Cylinder3P3_eig.inp -checkRHS -superlu -vtf 1 -nviz 3 -eig 4 -nev 16 -shift 1.0

cd ../P4
runSplineSol Cylinder1P4.inp -checkRHS -samg -vtf 1 -nviz 9
runSplineSol Cylinder2P4.inp -checkRHS -samg -vtf 1 -nviz 5
#runSplineSol Cylinder3P4.inp -checkRHS -samg -vtf 1 -nviz 3
#runSplineSol Cylinder4P4.inp -checkRHS -samg -vtf 1
runSplineSol Cylinder2P4_eig.inp -checkRHS -vtf 1 -nviz 5 -eig 4 -nev 16 -shift 1.0
