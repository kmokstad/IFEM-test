#!/bin/sh
if [ $# -lt 2 ]; then exec echo "usage: $0 [regularity] order steps"; fi
if [ $# -gt 2 ]; then name=ts$2-C$1; shift; else name=ts$1; fi
if [ ! -e $name.xinp ]; then exec echo "$0: File $name.xinp does not exist"; fi
if [ ! -d run ]; then mkdir run; fi
echo "# p = $1:"
echo "#    NEL    NNOD   NDOFS ||w^h||_E             w^h(0.5,0.5)"
h=0; u=3
while [ $h -lt $2 ]; do
	case=${name}_h$h
	v=$u
	u=$(((u+1)*2-1))
	refine="/refine.*=\"7\"/s/u=\".*\"/u=\"$u\" v=\"$u\"/;/refine.*=\"3\"/s/u=\".*\"/u=\"$v\" v=\"$v\"/"
	sed "$refine" $name.xinp > run/$case.xinp
	LinEl -2DKL -outPrec 15 run/$case.xinp |\
	tee run/$case.log | awk -f getnorm.awk
	h=$((h+1))
done
