#!/bin/sh
# $Id: run.sh,v 1.2 2009-06-11 18:50:44 kmo Exp $

check="-fixDup -checkRHS"
nodeck="-ignore 22 23 24 25 26 27 28 47 48 49 50 51 52 53 72 73 74 75 76 77 78 111 112 113 114 115 116 117 118 119 120 121 122 123 124"

runSplineSol Hull6.inp $check $nodeck -vtf 1
runSplineSol Hull6_free.inp $check $nodeck -vtf 1 -eig 4 -shift 1.0 -nev 16
#runSplineSol Hull6_free_p2.inp $check $nodeck -vtf 1 -nviz 3 -eig 4 -shift 1.0 -nev 16
