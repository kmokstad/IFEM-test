#!/bin/sh
# $Id: run.sh,v 1.1 2010-11-16 12:16:11 kmo Exp $
for model in pawn rook queen king board; do
runSplineSol $model.inp -eig 4 -nev 16 -ncv 32 -vtf 1 -nviz 3
done
