set logscale xy
set xrange [100:1000000]
set yrange [0.01:200]
set key top right font ",10"
set tics font ",12"
set xlabel "Number of DOFs" font ",12"
set ylabel "Relative energy error, |e|_E /|w|_E * 100%" font ",12"
plot '12.dat' with lines dt '-' title '-1/2', '22.dat' with lines dt '-' title '-2/2', \
'ScordelisLo-p2-UMR.dat' using 3:6 with linespoints title 'UMR p=2 r=1', \
'ScordelisLo-p2-AMR.dat' using 3:6 with linespoints title 'AMR p=2 r=1', \
'ScordelisLo-p3-UMR.dat' using 3:6 with linespoints title 'UMR p=3 r=2', \
'ScordelisLo-p3-AMR.dat' using 3:6 with linespoints title 'AMR p=3 r=2'
pause 2 "Wait.."
set term pdfcairo
set output 'ScordelisLo.pdf'
replot

set term qt
plot '12.dat' with lines dt '-' title '-1/2', '22.dat' with lines dt '-' title '-2/2', \
'ScordelisLo-p2-UMR.dat' using 3:6 with linespoints title 'UMR p=2 r=1'
pause 1 "Wait.."
set term pdfcairo
set output 'ScordelisLo-1.pdf'
replot

set term qt
plot '12.dat' with lines dt '-' title '-1/2', '22.dat' with lines dt '-' title '-2/2', \
'ScordelisLo-p2-UMR.dat' using 3:6 with linespoints title 'UMR p=2 r=1', \
'ScordelisLo-p2-AMR.dat' using 3:6 with linespoints title 'AMR p=2 r=1'
pause 1 "Wait.."
set term pdfcairo
set output 'ScordelisLo-2.pdf'
replot

set term qt
plot '12.dat' with lines dt '-' title '-1/2', '22.dat' with lines dt '-' title '-2/2', \
'ScordelisLo-p2-UMR.dat' using 3:6 with linespoints title 'UMR p=2 r=1', \
'ScordelisLo-p2-AMR.dat' using 3:6 with linespoints title 'AMR p=2 r=1', \
'ScordelisLo-p3-UMR.dat' using 3:6 with linespoints title 'UMR p=3 r=2'
pause 1 "Wait.."
set term pdfcairo
set output 'ScordelisLo-3.pdf'
replot
