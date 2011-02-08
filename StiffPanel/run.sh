#!/bin/sh
# $Id: run.sh,v 1.3 2010-01-12 13:40:04 kmo Exp $

runSplineSol StiffPanel.inp -vtf 1 -nviz 3
runSplineSol StiffPanel_eig.inp -vtf 1 -nviz 3 -eig 4
runSplineSol StiffPanel_free.inp -vtf 1 -nviz 3 -eig 4 -shift 1.0 -nev 16
runSplineSol StiffPanel_buckling.inp -vtf 1 -nviz 3 -eig 5 -shift 1.0 -nev 16
runSplineSol StiffPanel1.inp -vtf 1 -nviz 3
runSplineSol StiffPanel1_eig.inp -vtf 1 -nviz 3 -eig 4
runSplineSol StiffPanel1_free.inp -vtf 1 -nviz 3 -eig 4 -shift 1.0 -nev 16
runSplineSol StiffPanel1_buckling.inp -vtf 1 -nviz 3 -eig 5 -shift 1.0 -nev 16
