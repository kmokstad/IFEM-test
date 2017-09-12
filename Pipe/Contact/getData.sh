#!/bin/sh
for file in $*; do
case=`echo $file | sed 's/\.log//'`
echo $case
if grep -q 'Max L' $case.log; then
sed '/step/s/=/ /g' $case.log | awk -f getDataTL.awk > $case.dat
else
sed '/step/s/=/ /g' $case.log | awk -f getData.awk > $case.dat
fi
done
