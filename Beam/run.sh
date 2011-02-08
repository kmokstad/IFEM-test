#!/bin/sh
# $Id: run.sh,v 1.6 2010-06-22 09:02:31 kmo Exp $

runSplineSol Beam.inp -vtf 1
runSplineSol Beam_eig.inp -vtf 1 -eig 4
runSplineSol Beam_free.inp -vtf 1 -eig 4 -nev 16 -shift 1.0
runSplineSol Beam_buckling.inp -vtf 1 -eig 5 -nev 16 -shift 1.0

runSplineSol CanTS-p1.inp -vtf 1
runSplineSol CanTS-p2.inp -vtf 1
runSplineSol CanTS-p3.inp -vtf 1
runSplineSol -prefix Lagrange- CanTS-p1.inp -vtf 1 -lag
runSplineSol -prefix Lagrange- CanTS-p2.inp -vtf 1 -lag
runSplineSol -prefix Lagrange- CanTS-p3.inp -vtf 1 -lag

runSplineSol CanTS2D-p1.inp -vtf 1 -2D
runSplineSol CanTS2D-p2.inp -vtf 1 -2D
runSplineSol CanTS2D-p3.inp -vtf 1 -2D
runSplineSol -prefix Lagrange- CanTS2D-p1.inp -vtf 1 -lag -2D
runSplineSol -prefix Lagrange- CanTS2D-p2.inp -vtf 1 -lag -2D
runSplineSol -prefix Lagrange- CanTS2D-p3.inp -vtf 1 -lag -2D

runSplineSol CanTM2D-p1.inp -vtf 1 -2D
runSplineSol CanTM2D-p2.inp -vtf 1 -2D
