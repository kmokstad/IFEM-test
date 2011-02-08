#!/bin/sh
# $Id: plotFreq.sh,v 1.1 2010-03-17 15:46:12 kmo Exp $

input=$1
if [ ! -r "$input" ]; then exec echo "usage: $0 <file> [-eps]"; fi
if [ ! -d plots ]; then mkdir plots; fi

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
set ylabel "Frequency [Hz] for Mode $m"
set key right top
plot "$input" using 1:$col title "NURBS" with linespoints, \
"../../StdFEM/frequency/bHole-p2.freq" using 11:$m title "Lagrange" with linespoints
EOFg

  echo Writing $output
  gnuplot /tmp/gnuplot.com

done
