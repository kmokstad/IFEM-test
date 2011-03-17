#!/bin/sh
# $Id: runNL.sh,v 1.3 2010-11-09 14:31:24 kmo Exp $

runNonlinel -prefix Lagrange- Cyl-p2-h1.inp -UL -vtf 1 -nGauss 3 -lag
runNonlinel -prefix Lagrange- Cyl-p2-h2.inp -UL -vtf 1 -nGauss 3 -lag
runNonlinel -prefix Lagrange- Cyl-p2-h3.inp -UL -vtf 1 -nGauss 3 -lag
runNonlinel -prefix Lagrange- Cyl-p2-h4.inp -UL -vtf 1 -nGauss 3 -lag
runNonlinel Cyl-p2-h1.inp -UL -vtf 1 -nGauss 3 -nviz 3
runNonlinel Cyl-p2-h2.inp -UL -vtf 1 -nGauss 3 -nviz 3
runNonlinel Cyl-p2-h3.inp -UL -vtf 1 -nGauss 3 -nviz 3
runNonlinel Cyl-p2-h4.inp -UL -vtf 1 -nGauss 3 -nviz 3
runNonlinel -prefix Lagrange- Cyl_p3-h1.inp -UL -vtf 1 -lag
runNonlinel -prefix Lagrange- Cyl_p3-h2.inp -UL -vtf 1 -lag
runNonlinel -prefix Lagrange- Cyl_p3-h3.inp -UL -vtf 1 -lag
runNonlinel -prefix Lagrange- Cyl_p3-h4.inp -UL -vtf 1 -lag
runNonlinel Cyl_p3-h1.inp -UL -vtf 1 -nviz 3
runNonlinel Cyl_p3-h2.inp -UL -vtf 1 -nviz 3
runNonlinel Cyl_p3-h3.inp -UL -vtf 1 -nviz 3
runNonlinel Cyl_p3-h4.inp -UL -vtf 1 -nviz 3
runNonlinel -prefix Lagrange- Cyl-p3-h1.inp -UL -vtf 1 -lag
runNonlinel -prefix Lagrange- Cyl-p3-h2.inp -UL -vtf 1 -lag
runNonlinel -prefix Lagrange- Cyl-p3-h3.inp -UL -vtf 1 -lag
runNonlinel -prefix Lagrange- Cyl-p3-h4.inp -UL -vtf 1 -lag
runNonlinel Cyl-p3-h1.inp -UL -vtf 1 -nviz 3
runNonlinel Cyl-p3-h2.inp -UL -vtf 1 -nviz 3
runNonlinel Cyl-p3-h3.inp -UL -vtf 1 -nviz 3
runNonlinel Cyl-p3-h4.inp -UL -vtf 1 -nviz 3
runNonlinel -prefix Lagrange- Cyl_p4-h1.inp -UL -vtf 1 -nGauss 5 -lag
runNonlinel -prefix Lagrange- Cyl_p4-h2.inp -UL -vtf 1 -nGauss 5 -lag
runNonlinel -prefix Lagrange- Cyl_p4-h3.inp -UL -vtf 1 -nGauss 5 -lag
runNonlinel Cyl_p4-h1.inp -UL -vtf 1 -nviz 5
runNonlinel Cyl_p4-h2.inp -UL -vtf 1 -nviz 5
runNonlinel Cyl_p4-h3.inp -UL -vtf 1 -nviz 5
runNonlinel Cyl_p4-h4.inp -UL -vtf 1 -nviz 5
runNonlinel -prefix Lagrange- Cyl-p4-h1.inp -UL -vtf 1 -nGauss 5 -lag
runNonlinel -prefix Lagrange- Cyl-p4-h2.inp -UL -vtf 1 -nGauss 5 -lag
runNonlinel -prefix Lagrange- Cyl-p4-h3.inp -UL -vtf 1 -nGauss 5 -lag
runNonlinel Cyl-p4-h1.inp -UL -vtf 1 -nviz 5
runNonlinel Cyl-p4-h2.inp -UL -vtf 1 -nviz 5
runNonlinel Cyl-p4-h3.inp -UL -vtf 1 -nviz 5
runNonlinel Cyl-p4-h4.inp -UL -vtf 1 -nviz 5
runNonlinel Cyl_p5-h4.inp -UL -vtf 1 -nviz 5
