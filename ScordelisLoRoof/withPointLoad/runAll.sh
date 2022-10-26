#!/bin/sh

for case in ScordelisPoint-p2 ScordelisPoint-p3 ScordelisPoint-r1-p3; do
echo "\nRunning Adaptive $case ..."
../runAMR.sh $case.xinp
done

for case in ScordelisPoint-NURBS-p2 ScordelisPoint-NURBS-p3 ScordelisPoint-NURBSr1-p3; do
echo "\nRunning Adaptive $case ..."
../runAMR.sh $case.xinp -LRn
done

echo "\nRunning Uniform spline cases ..."
../runUMR.sh ScordelisPoint 2 6
../runUMR.sh ScordelisPoint 3 6
../runUMR.sh ScordelisPoint-r1 3 6

echo "\nRunning Uniform NURBS cases ..."
../runUMR.sh ScordelisPoint-NURBS 2 6
../runUMR.sh ScordelisPoint-NURBS 3 6
../runUMR.sh ScordelisPoint-NURBSr1 3 6
