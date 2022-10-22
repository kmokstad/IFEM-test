#!/bin/sh
name=$1-p$2
if [ $# -lt 3 ]; then exec echo "usage: $0 name order steps"; fi
if [ ! -e $name.xinp ]; then exec echo "$0: File $name.xinp does not exist"; fi
if [ ! -d run ]; then mkdir run; fi
shift; shift; shift
dir=`dirname $0`
#
#echo "# NEL  NELS  NNOD NNODS NDOFS Internal_energy  External_energy   w                    "\
#     "sigma_x(top)          sigma_y(top)          sigma_1(top)          sigma_2(top)          von_Mises(top)        "\
#     "sigma_x(bottom)       sigma_y(bottom)       sigma_1(bottom)       sigma_2(bottom)       von_Mises(bottom)" | tee $name-UMR.dat
#cp $dir/getstress.awk .tmp.awk
echo "#    NEL    NNOD   NDOFS Internal_energy External_energy Estimated_error(%)" | tee $name-UMR.dat
cp $dir/getres.awk .tmp.awk
#
u0=`awk -F'"' '/<refine/{print$4}' $name.xinp | tail -1`
h=0; u=$u0
LinEl -2DKLshell -outPrec 15 $name.xinp |\
tee run/$name-h0.log | awk -f .tmp.awk | tee -a $name-UMR.dat
while [ $h -lt $3 ]; do
  h=$((h+1))
  u=$((u*2+1))
  case=$name-h$h
  refine="/<refine/s/u=\".*\"/u=\"$u\" v=\"$u\"/"
  sed "$refine" $name.xinp > run/$case.xinp
  LinEl -2DKLshell -outPrec 15 run/$case.xinp |\
  tee run/$case.log | awk -f .tmp.awk | tee -a $name-UMR.dat
done
