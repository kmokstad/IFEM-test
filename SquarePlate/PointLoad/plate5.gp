load 'AnaSol.gp'

set logscale xy
set xrange [50:5000]
set key bottom left font ",10"
set tics font ",12"
set xlabel "Number of DOFs" font ",12"
set ylabel "Relative energy error, |e|_E /|w|_E * 100%" font ",12"
#plot '42.dat' with lines dt '-' title '-4/2', \
#'AMR-p5-C3.dat' using 3:(Erel($4)) with linespoints title 'Exact p=5 r=3 AMR', \
#'AMR-p5-C3.dat' using 3:(Rele($6)) with linespoints title  'CGL2 p=5 r=3 AMR', \
#'AMR-p5-C2.dat' using 3:(Erel($4)) with linespoints title 'Exact p=5 r=2 AMR', \
#'AMR-p5-C2.dat' using 3:(Rele($6)) with linespoints title  'CGL2 p=5 r=2 AMR'
plot '42.dat' with lines dt '-' title '-4/2', \
'UMR-p5.dat'    using 3:(Erel($4)) with linespoints title 'Exact p=5 r=4(4) UMR', \
'UMR-p5.dat'    using 3:(Rele($6)) with linespoints title  'CGL2 p=5 r=4(4) UMR', \
'AMR-p5.dat'    using 3:(Erel($4)) with linespoints title 'Exact p=5 r=4(4) AMR', \
'AMR-p5.dat'    using 3:(Rele($6)) with linespoints title  'CGL2 p=5 r=4(4) AMR', \
'AMR-p5-C1.dat' using 3:(Erel($4)) with linespoints title 'Exact p=5 r=4(1) AMR', \
'AMR-p5-C1.dat' using 3:(Rele($6)) with linespoints title  'CGL2 p=5 r=4(1) AMR', \
'Gustafson2017ape-UMR.dat' using 1:(Rele($2)) with linespoints title 'Exact Gustafsson p=5 UMR', \
'Gustafson2017ape-AMR.dat' using 1:(Rele($2)) with linespoints title 'Exact Gustafsson p=5 AMR'
pause 2 "Wait.."
set term pdfcairo
set output 'PlatePointLoad-p5-err.pdf'
replot

set term qt
set nologscale y
set yrange [0:2]
set key top right font ",12"
set ylabel "Effectivity index" font ",12"
#plot 1 with lines notitle, \
#'AMR-p5-C3.dat' using 3:(Eff($6,$5)) with linespoints title 'p=5 r=3 AMR', \
#'AMR-p5-C2.dat' using 3:(Eff($6,$5)) with linespoints title 'p=5 r=2 AMR'
plot 1 with lines notitle, \
'UMR-p5.dat'    using 3:(Eff($6,$5)) with linespoints title 'p=5 r=4(4) UMR', \
'AMR-p5.dat'    using 3:(Eff($6,$5)) with linespoints title 'p=5 r=4(4) AMR', \
'AMR-p5-C1.dat' using 3:(Eff($6,$5)) with linespoints title 'p=5 r=4(1) AMR'
pause 2 "Wait.."
set term pdfcairo
set output 'PlatePointLoad-p5-eff.pdf'
replot
