#!/bin/sh
# $Id: plotEig.sh,v 1.2 2009-11-03 10:25:28 kmo Exp $

input=$1
if [ ! -r "$input" ]; then exec echo "usage: $0 <file> [-eps]"; fi
if [ ! -d plots ]; then mkdir plots; fi

ncol=`awk '/# *NDOF/{print NF-1}' $input`
for m in 1 2 3 4 5 6 7 8 9 10; do
  col=$((m+1))

  if [ "$2" = "-eps" ]; then
    terminal="postscript color eps"
    output=plots/`basename $input .eig`_$m.eps
  else
    title=`awk -F'\t' '/# *TITLE/{print$2}' $input`
    terminal=gif
    output=plots/`basename $input .eig`_$m.gif
  fi

  cat << EOFg > /tmp/gnuplot.com
set title "$title"
set terminal $terminal
set output "$output"
set logscale xy
set xrange [100:50000]
set xlabel "Number of degrees of freedom"
set yrange [0.0003:0.1]
set ylabel "Eigenvalue for Mode $m"
set key right top
plot "$input" using 1:$col title "NURBS-1" with linespoints, \
"C1/lHole-p2.eig" using 1:$col title "NURBS-2" with linespoints, \
"Lagrange/$input" using $ncol:$m title "Lagrange-1" with linespoints, \
"Lagrange/lHole-p2.eig" using $ncol:$m title "Lagrange-2" with linespoints
EOFg

  echo Writing $output
  gnuplot /tmp/gnuplot.com

done
