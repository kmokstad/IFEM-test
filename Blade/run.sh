#!/bin/sh
# $Id: run.sh,v 1.1 2010-11-21 18:35:17 kmo Exp $

runSplineSol Blade.inp -vtf 1 -eig 4 -nev 16 -ncv 32 -nu 5
runSplineSol Blade-fixed.inp -vtf 1 -eig 4 -nev 16 -ncv 32 -nu 5
runSplineSol BladeTS.inp -vtf 1 -nu 5
runNonlinel  BladeTSnl.inp -vtf 1 -nu 5
