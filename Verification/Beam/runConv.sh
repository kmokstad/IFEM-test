#!/bin/sh
file=`basename $1 .xinp`.xinp
if [ ! -e $file ]; then exec echo "usage: $0 <input-file>"; fi
echo "#NDOF Uz(L) |U^h-U|_L2"
for X in 0 1 3 7 15 31 63 127 255 511; do
  sed "s/X/$X/" $file > /tmp/$USER.xinp
  NonLinEl /tmp/$USER.xinp -1D -outPrec 12 |\
  awk '/Number of dofs/{n=$4};/Max Z/{d=$4};/\|e\|/{print n,d,$5}'
done
