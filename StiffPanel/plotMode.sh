#!/bin/sh
# $Id: plotMode.sh,v 1.1 2009-06-14 12:43:12 kmo Exp $
prefix=StiffPanel1_free
mode=$1
if [ -z "$mode" ]; then exec echo "usage: $0 <mode> [-time]"; fi
if [ ! -d plots ]; then mkdir plots; fi

cat << EOFa > /tmp/tmp.awk
/#  *REF/ {
  ncol = NF-1;
  ref = \$($mode-4)
}
/^[^#]/ {
  if (NF > $mode-6) printf "%8d\t%g",\$1,\$($mode-5)/ref;
  if (NF > ncol) printf "\t%g", \$NF
  printf "\n";
}
EOFa
for p in 1 12 21 2 31 32 3; do
  awk -f /tmp/tmp.awk ${prefix}_p$p.eig  > /tmp/tmp$p.dat
done

if [ "$2" = "-time" ]; then shift;
  x="3"
  xrange="[0.1:1000]"
  xlabel="CPU time [s]"
else
  x="1"
  xrange="[1000:1000000]"
  xlabel="Number of degrees of freedom"
fi

output=plots/${prefix}_Mode$mode.gif
cat << EOFg > /tmp/gnuplot.com
set title "Convergence of Mode $mode for varying spline order"
set terminal gif
set output "$output"
set logscale x
set xrange $xrange
set xlabel "$xlabel"
set yrange [0:1.02]
set ytics 0.1
set ylabel "Normalized Eigenvalue 1/omega^2"
set key right bottom
plot \
'/tmp/tmp1.dat'  using $x:2 title "p = 1,1,1" with linespoints, \
'/tmp/tmp12.dat' using $x:2 title "p = 1,1,2" with linespoints, \
'/tmp/tmp21.dat' using $x:2 title "p = 2,2,1" with linespoints, \
'/tmp/tmp2.dat'  using $x:2 title "p = 2,2,2" with linespoints, \
'/tmp/tmp31.dat' using $x:2 title "p = 3,3,1" with linespoints, \
'/tmp/tmp32.dat' using $x:2 title "p = 3,3,2" with linespoints, \
'/tmp/tmp3.dat'  using $x:2 title "p = 3,3,3" with linespoints, \
1 notitle
EOFg

echo Writing $output
gnuplot /tmp/gnuplot.com
