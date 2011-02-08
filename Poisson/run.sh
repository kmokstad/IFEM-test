#!/bin/sh
# $Id: run.sh,v 1.2 2010-09-07 07:54:58 kmo Exp $

runPoisson Line.inp -vtf 1 -1D
runPoisson Square.inp -vtf 1 -2D
runPoisson Lshape.inp -vtf 1 -2D
runPoisson Cube.inp -vtf 1
