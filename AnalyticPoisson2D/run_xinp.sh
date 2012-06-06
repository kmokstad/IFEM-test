#!/bin/bash

if [ $# -eq 0 ]; then
	EXAMPLE_NAME=LS
else
	EXAMPLE_NAME=$1
fi

if [ ! -f ${EXAMPLE_NAME}.xinp ]; then
	echo "Error: Template file ${EXAMPLE_NAME}.xinp not found"
	exit 1
fi

MAXITER=100
MAXDOF=3000

if [ ! -d $EXAMPLE_NAME ]; then
	mkdir $EXAMPLE_NAME
fi

echo ""
echo "******************************"
echo ""
echo "Running example ${EXAMPLE_NAME}"
echo ""
echo "******************************"
echo ""

for p in `seq 2 4`; do
	if [ $p -eq 1 ]; then
		mstep=1
	else
		mstep=$((p-1))
	fi
	for m in `seq 1 $mstep $p`; do
		for s in 'minspan' 'fullspan' 'isotropic_function' ; do
			for b in 5 20 ; do
				echo "p = $p, m = $m, s = $s, b = $b"
				sed "s/RAISEORDER1/$((p-m))/g" ${EXAMPLE_NAME}.xinp > tmp
				sed "s/RAISEORDER2/$((m-1))/g" tmp                  > tmp2
				sed "s/BETA/$b/"               tmp2                 > tmp
				sed "s/SCHEME/$s/"             tmp                  > tmp2
				sed "s/MULT/$m/"               tmp2                 > tmp
				sed "s/MAXITER/${MAXITER}/"    tmp                  > tmp2
				sed "s/MAXDOF/${MAXDOF}/"      tmp2                 > tmp
				sed "s/NGAUSS/$((p+1))/"       tmp                  > ${EXAMPLE_NAME}_gen.xinp

				../../Release/bin/Poisson -2D -LR -adap ${EXAMPLE_NAME}_gen.xinp > out.log
				cp ${EXAMPLE_NAME}_gen.xinp ${EXAMPLE_NAME}/p$p-m$m-b$b-$s.xinp
				cp out.log                  ${EXAMPLE_NAME}/p$p-m$m-b$b-$s.log

# 				grep "Exact relative err" out.log | sed 's/Exact relative error (%) : //'            > ${EXAMPLE_NAME}/err-p$p-m$m-s$s-b$b.m
# 				grep "(RMS) of"           out.log | sed 's/Root mean square (RMS) of est.err    ://' > ${EXAMPLE_NAME}/rms-p$p-m$m-s$s-b$b.m
# 				grep "Number of unknowns" out.log | sed 's/Number of unknowns   //'                  > ${EXAMPLE_NAME}/dof-p$p-m$m-s$s-b$b.m
# 				grep "Number of elements" out.log | sed "s/Number of elements//"                     > ${EXAMPLE_NAME}/el-p$p-m$m-s$s-b$b.m
# 				grep "Adaptive step #"    out.log | sed "s/Adaptive step #...//" | sed "s/|//g"      > ${EXAMPLE_NAME}/time-p$p-m$m-s$s-b$b.m
# 				grep "Refinement step #"  out.log | sed "s/Refinement step #...//" | sed "s/|//g"    > ${EXAMPLE_NAME}/refine-time-p$p-m$m-s$s-b$b.m
# 				grep "Total time"         out.log | sed "s/Total time//"         | sed "s/|//g"      > ${EXAMPLE_NAME}/totaltime-p$p-m$m-s$s-b$b.m

# 				if [ ! -d $EXAMPLE_NAME/mesh-p$p-m$m-s$s-b$b ]; then
# 					mkdir $EXAMPLE_NAME/mesh-p$p-m$m-s$s-b$b
# 				fi
# 				
# 				for i in `seq 1 $MAXITER`; do
# 					iprint=`printf %03d $i`
# 					if [ -f param_mesh_$iprint.eps ]; then
# # 						mv param_mesh_$iprint.eps    ${EXAMPLE_NAME}/mesh-p$p-m$m-s$s-b$b/param_$iprint.eps
# 						rm param_mesh_$iprint.eps    
# 						mv physical_mesh_$iprint.eps ${EXAMPLE_NAME}/mesh-p$p-m$m-s$s-b$b/physical_$iprint.eps
# 					fi
# 				done
			done
		done
	done
done
# rm out.log
# rm ${EXAMPLE_NAME}_generated.inp
