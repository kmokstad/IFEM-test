#!/bin/sh
# $Id: get_MaxX.sh,v 1.1 2010-10-17 11:48:23 kmo Exp $
# Extract som data fromthe log-files for plotting:
echo "#NDOF\tMax_X\tEint\tEext"
for file in $1*.log; do
awk '/unknowns/{printf"%d\t",$4}' $file
awk '/Max X/{d=$4};/Energy/{i=$7};/External/{e=$5};\
     END{printf"%g\t%g\t%g\n",d,i,e}' $file
done
