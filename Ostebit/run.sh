#!/bin/sh
# $Id: run.sh,v 1.1 2010-03-09 08:34:37 kmo Exp $

runSplineSol ost.inp -eig 4 -nev 16 -ncv 32 -checkRHS
