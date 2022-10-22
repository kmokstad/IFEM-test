#!/bin/sh
input=`basename $1 .xinp`
if [ ! -f $input.xinp ]; then exec echo "usage: $0 <inputfile>"; fi
if [ -z `which LinEl` ]; then exec echo "No program 'LinEl' in $PATH"; fi
#
shift
output=${input}-AMR
echo "#    NEL    NNOD   NDOFS Internal_energy External_energy Estimated_error(%)" > $output.dat
cat << EOF > .tmp.awk
/Number of elements/ { printf "%8d",\$4 }
/Number of nodes/    { printf "%8d",\$4 }
/Number of unknowns/ { printf "%8d",\$4 }
/Energy norm       / { printf "%16.10f",\$5 }
/External energy   / { printf "%16.10f",\$5 }
/- relative error /  { if ((++i)%3 == 1) printf "%14.10f\n",\$8 }
EOF
#
LinEl $input.xinp -2DKLshell -outPrec 15 -adap -vtf 1 $* | tee $output.log |\
egrep 'Adaptive|Number of elements|Error norm'

awk -f .tmp.awk  $output.log >> $output.dat
echo "\nDone. Resulting errors (stored in $output.dat):"
cat $output.dat
