#!/bin/bash
# Make the tensor-spline meshes
export PYTHONPATH=..:../..
python3 scordelisloref.py 2
python3 scordelisloref.py 3
# Make LR-meshes with internal crack u,v in 0.25x[0.25,0.5]
pushd ../../utils; make; popd
../../utils/crackIt scordelis-lo-s2-4x4.g2 -u 0.25 0.25 0.5
../../utils/crackIt scordelis-lo-s3-4x4.g2 -u 0.25 0.25 0.5
for case in ScordelisLo-p2 ScordelisLo-p3; do
echo -e "\nRunning Adaptive $case ..."
../runAMR.sh $case.xinp -shrink 0.001
done
echo -e "\nRunning Uniform spline cases ..."
./runUMR.sh ScordelisLo 2 7
./runUMR.sh ScordelisLo 3 6
