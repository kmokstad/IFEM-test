#!/bin/sh
# $Id: plotEig.sh,v 1.1 2009-06-14 12:43:12 kmo Exp $
input=$1
if [ ! -r "$input" ]; then exec echo "usage: $0 <file> [-rel][-time]"; fi
if [ ! -d plots ]; then mkdir plots; fi

if [ "$2" = "-rel" ]; then shift;
  cat << EOFa > /tmp/tmp.awk
/#  *REF/ {
  ncol = NF-1;
  for (i = 3; i <= NF; i++)
    ref[i-3] = \$i
}
/^[^#]/ {
  printf "%8d",\$1;
  for (i = 2; i <= ncol; i++)
    printf "\t%g",\$i/ref[i-2];
  if (NF > ncol) printf "\t%g", \$NF
  printf "\n";
}
EOFa
  awk -f /tmp/tmp.awk $input > /tmp/tmp.dat
  ylabel="Normalized Eigenvalue 1/omega^2"
  logscale="x"
  yrange="[0:1.02]"
  ytics="0.1"
else
  cp $input /tmp/tmp.dat
  ylabel="Eigenvalue 1/omega^2"
  logscale="xy"
  yrange="[1.0e-6:0.1]"
  ytics="in"
fi

if [ "$2" = "-time" ]; then shift;
  x="NF-1"
  xrange="[0.1:1000]"
  xlabel="CPU time [s]"
else
  x="1"
  xrange="[1000:1000000]"
  xlabel="Number of degrees of freedom"
fi

output=plots/`basename $input .eig`.gif
title=`awk -F'\t' '/# *TITLE/{print$2}' $input`
cat << EOFg > /tmp/gnuplot.com
set title "$title"
set terminal gif
set output "$output"
set logscale $logscale
set xrange $xrange
set xlabel "$xlabel"
set yrange $yrange
set ytics $ytics
set ylabel "$ylabel"
set key right bottom
EOFg

cat << EOFp > /tmp/tmp.awk
BEGIN { printf "plot " }
/#  *NDOF/ {
  for (i = 3; i < NF-1; i++)
    printf "'/tmp/tmp.dat' using %d:%d title \"%s\" with linespoints, ", $x, i-1, \$i;
  printf "'/tmp/tmp.dat' using %d:%d title \"%s\" with linespoints\n", $x, NF-2, \$(NF-1);
}
EOFp
awk -f /tmp/tmp.awk $input >> /tmp/gnuplot.com

echo Writing $output
gnuplot /tmp/gnuplot.com
