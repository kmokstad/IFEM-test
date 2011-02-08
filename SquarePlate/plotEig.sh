#!/bin/sh
# $Id: plotEig.sh,v 1.2 2009-11-04 15:17:47 kmo Exp $
input=$1
if [ ! -r "$input" ]; then exec echo "usage: $0 <file> [-eps]"; fi
if [ ! -d plots ]; then mkdir plots; fi

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

if [ "$2" = "-eps" ]; then
  terminal="postscript color eps"
  output=plots/`basename $input .eig`.eps
else
  title=`awk -F'\t' '/# *TITLE/{print$2}' $input`
  terminal=gif
  output=plots/`basename $input .eig`.gif
fi
cat << EOFg > /tmp/gnuplot.com
set title "$title"
set terminal $terminal
set output "$output"
set logscale x
set xrange [300:120000]
set xlabel "Number of degrees of freedom"
set yrange [0.95:1.4]
set ytics 0.05
set ylabel "Normalized Eigenvalue"
set key right top
EOFg

cat << EOFp > /tmp/tmp.awk
BEGIN { printf "plot 1 title \"Thin-plate solution\"," }
/#  *NDOF/ {
  for (i = 3; i < NF-1; i++)
    printf "'/tmp/tmp.dat' using %d:%d title \"%s\" with linespoints, ", 1, i-1, \$i;
  printf "'/tmp/tmp.dat' using %d:%d title \"%s\" with linespoints\n", 1, NF-2, \$(NF-1);
}
EOFp
awk -f /tmp/tmp.awk $input >> /tmp/gnuplot.com

echo Writing $output
gnuplot /tmp/gnuplot.com
