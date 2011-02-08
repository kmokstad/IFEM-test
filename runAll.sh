#!/bin/sh
# $Id: runAll.sh,v 1.2 2009-06-09 07:00:16 kmo Exp $

dir=$PWD
if [ ! -d results ]; then mkdir results; fi
for run in */run.sh; do
cd $dir/`dirname $run`; pwd; ./run.sh
mv `find . -name '*.vtf'` ../results
done
