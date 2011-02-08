#!/bin/sh
# $Id: run.sh,v 1.1 2010-03-18 10:24:04 kmo Exp $

runSplineSol AHole_free.inp -eig 4 -nev 16 -ncv 32 -checkRHS
