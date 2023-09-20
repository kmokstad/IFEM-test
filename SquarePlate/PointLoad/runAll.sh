#!/bin/bash
if [ $# -lt 1 ]; then exec echo "usage: $0 maxP"; fi

for (( p=2; p<=$1; p++ )); do
  for (( r=1; r<$p; r++ )); do
    echo AMR p=$p r=$r
    if [ $r -eq $((p-1)) ]; then
      LinEl -2DKL ts$p.xinp -adap1 -vtf 1 -outPrec 15 |\
      tee AMR-p$p.log | awk -f getnorm.awk | tee AMR-p$p.dat
    else
      LinEl -2DKL ts$p-C$r.xinp -adap1 -vtf 1 -outPrec 15 |\
      tee AMR-p$p-C$r.log | awk -f getnorm.awk | tee AMR-p$p-C$r.dat
    fi
    echo UMR p=$p
    if [ $r -eq $((p-1)) ]; then
      ./runUMR.sh $p 4 | tee UMR-p$p.dat
    else
      ./runUMR.sh $r $p 4 | tee UMR-p$p-C$r.dat
    fi
  done
done
