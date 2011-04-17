#!/bin/sh
# $Id$
# These are the cases used in the NSCM-23 presentation.

runNonlinel -prefix Lagrange- Cyl-p2-h1.inp -UL -vtf 1 -nGauss 3 -lag
runNonlinel -prefix Lagrange- Cyl-p2-h2.inp -UL -vtf 1 -nGauss 3 -lag
runNonlinel -prefix Lagrange- Cyl-p2-h3.inp -UL -vtf 1 -nGauss 3 -lag
runNonlinel -prefix Lagrange- Cyl-p2-h4.inp -UL -vtf 1 -nGauss 3 -lag
./get_MaxX.sh Lagrange-Cyl-p2 > Lagrange-Cyl-p2.dat
runNonlinel Cyl-p2-h1.inp -UL -vtf 1 -nGauss 3 -nviz 3
runNonlinel Cyl-p2-h2.inp -UL -vtf 1 -nGauss 3 -nviz 3
runNonlinel Cyl-p2-h3.inp -UL -vtf 1 -nGauss 3 -nviz 3
runNonlinel Cyl-p2-h4.inp -UL -vtf 1 -nGauss 3 -nviz 3
./get_MaxX.sh Cyl-p2 > Cyl-p2.dat

runNonlinel Cyl_p3-h1.inp -UL -vtf 1 -nviz 3
runNonlinel Cyl_p3-h2.inp -UL -vtf 1 -nviz 3
runNonlinel Cyl_p3-h3.inp -UL -vtf 1 -nviz 3
runNonlinel Cyl_p3-h4.inp -UL -vtf 1 -nviz 3
./get_MaxX.sh Cyl_p3 > Cyl_p3.dat
runNonlinel -prefix Lagrange- Cyl-p3-h1.inp -UL -vtf 1 -lag
runNonlinel -prefix Lagrange- Cyl-p3-h2.inp -UL -vtf 1 -lag
runNonlinel -prefix Lagrange- Cyl-p3-h3.inp -UL -vtf 1 -lag
runNonlinel -prefix Lagrange- Cyl-p3-h4.inp -UL -vtf 1 -lag
./get_MaxX.sh Lagrange-Cyl-p3 > Lagrange-Cyl-p3.dat
runNonlinel Cyl-p3-h1.inp -UL -vtf 1 -nviz 3
runNonlinel Cyl-p3-h2.inp -UL -vtf 1 -nviz 3
runNonlinel Cyl-p3-h3.inp -UL -vtf 1 -nviz 3
runNonlinel Cyl-p3-h4.inp -UL -vtf 1 -nviz 3
./get_MaxX.sh Cyl-p3 > Cyl-p3.dat

runNonlinel Cyl_p4-h1.inp -UL -vtf 1 -nviz 5
runNonlinel Cyl_p4-h2.inp -UL -vtf 1 -nviz 5
runNonlinel Cyl_p4-h3.inp -UL -vtf 1 -nviz 5
runNonlinel Cyl_p4-h4.inp -UL
./get_MaxX.sh Cyl_p4 > Cyl_p4.dat
runNonlinel -prefix Lagrange- Cyl-p4-h1.inp -UL -vtf 1 -nGauss 5 -lag
runNonlinel -prefix Lagrange- Cyl-p4-h2.inp -UL -vtf 1 -nGauss 5 -lag
runNonlinel -prefix Lagrange- Cyl-p4-h3.inp -UL -vtf 1 -nGauss 5 -lag
./get_MaxX.sh Lagrange-Cyl-p4 > Lagrange-Cyl-p4.dat
runNonlinel Cyl-p4-h1.inp -UL -vtf 1 -nviz 5
runNonlinel Cyl-p4-h2.inp -UL -vtf 1 -nviz 5
runNonlinel Cyl-p4-h3.inp -UL -vtf 1 -nviz 5
runNonlinel Cyl-p4-h4.inp -UL
./get_MaxX.sh Cyl-p4 > Cyl-p4.dat

# This is for the reference solution
runNonlinel Cyl_p5-h4.inp -UL
