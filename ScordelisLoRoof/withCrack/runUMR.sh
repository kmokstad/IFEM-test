#!/bin/sh
p=$2
steps=$3
name=$1-p$p
lrname=scordelis-lo-s$p
if [ $# -lt 3 ]; then exec echo "usage: $0 name order steps [options]"; fi
if [ ! -e $name.xinp ]; then exec echo "$0: File $name.xinp does not exist"; fi
if [ ! -d run ]; then mkdir run; fi
shift; shift; shift
echo "#    NEL    NNOD   NDOFS Internal_energy External_energy Estimated_error(%)" | tee $name-UMR.dat
h=0; u=4
LinEl -2DKLshell -outPrec 15 -LR $* $name.xinp |\
tee run/$name-h0.log | awk -f ../getres.awk | tee -a $name-UMR.dat
cd run
while [ $h -lt $steps ]; do
  h=$((h+1))
  u=$((u*2))
  case=$name-h$h
  lrfile=$lrname-${u}x${u}
  python3 ../scordelisloref.py $p $u
  ../../../utils/crackIt $lrfile.g2 -u 0.25 0.25 0.5
  refine="/<patchfile/s/>.*</>$lrfile.lr</"
  sed "$refine" ../$name.xinp > $case.xinp
  LinEl -2DKLshell -outPrec 15 -LR $* $case.xinp |\
  tee $case.log | awk -f ../../getres.awk | tee -a ../$name-UMR.dat
done
