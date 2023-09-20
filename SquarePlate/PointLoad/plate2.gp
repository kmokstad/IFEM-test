load 'AnaSol.gp'

set logscale xy
set xrange [50:5000]
set key bottom left font ",10"
set tics font ",12"
set xlabel "Number of DOFs" font ",12"
set ylabel "Relative energy error, |e|_E /|w|_E * 100%" font ",12"
plot '12.dat' with lines dt '-' title '-1/2', \
'UMR-p2.dat' using 3:(Erel($4)) with linespoints title 'Exact p=2 r=1 UMR', \
'AMR-p2.dat' using 3:(Erel($4)) with linespoints title 'Exact p=2 r=1 AMR', \
'UMR-p2.dat' using 3:(Rele($6)) with linespoints title 'CGL2 p=2 r=1 UMR', \
'AMR-p2.dat' using 3:(Rele($6)) with linespoints title 'CGL2 p=2 r=1 AMR'
pause 2 "Wait.."
set term pdfcairo
set output 'PlatePointLoad-p2-err.pdf'
replot

set term qt
set nologscale y
set yrange [0:2]
set key top right font ",12"
set ylabel "Effectivity index" font ",12"
plot 1 with lines notitle, \
'UMR-p2.dat' using 3:(Eff($6,$5)) with linespoints title 'p=2 r=1 UMR', \
'AMR-p2.dat' using 3:(Eff($6,$5)) with linespoints title 'p=2 r=1 AMR'
pause 2 "Wait.."
set term pdfcairo
set output 'PlatePointLoad-p2-eff.pdf'
replot
