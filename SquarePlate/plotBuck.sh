#!/bin/sh
# $Id: plotBuck.sh,v 1.1 2009-11-03 10:00:41 kmo Exp $
input=$1
if [ ! -r "$input" ]; then exec echo "usage: $0 <file> [-eps]"; fi
if [ ! -d plots ]; then mkdir plots; fi

for m in 1 2 3 4 5 6 7 8 9 10 11; do
  col=$((m+1))
  mode=`awk '/# *NDOF/{print$'"$((m+2))"'}' $input`
  if [ "$2" = "-eps" ]; then
    terminal="postscript color eps"
    output=plots/`echo $input | sed 's/\..*$//'`_$mode.eps
  else
    title=`awk -F'\t' '/# *TITLE/{print$2}' $input`
    terminal=gif
    output=plots/`echo $input | sed 's/\..*$//'`_$mode.gif
  fi
  ref=`awk '/# *REF/{print$'"$((m+2))"'}' $input`
  cat << EOFg > /tmp/gnuplot.com
set title "$title"
set terminal $terminal
set output "$output"
set logscale x
set xrange [500:70000]
set xlabel "Number of degrees of freedom"
set yrange [0.95:1.45]
set ytics 0.05
set ylabel "Normalized eigenvalue for Mode $mode"
set key right top
plot "$input" using 1:(\$$col/$ref) title "NURBS" with linespoints, \
"Lagrange/$input" using 12:(\$$m/$ref) title "Lagrange" with linespoints, \
1 title "Thin plate solution"
EOFg

  echo Writing $output
  gnuplot /tmp/gnuplot.com

done
