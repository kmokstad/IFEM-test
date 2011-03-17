#!/bin/sh
# $Id: runNLL.sh,v 1.1 2010-10-17 11:48:23 kmo Exp $

runNonlinel -prefix Lagrange- ThickCyl-p2-h1.inp -UL -vtf 1 -nGauss 3 -lag
runNonlinel -prefix Lagrange- ThickCyl-p2-h2.inp -UL -vtf 1 -nGauss 3 -lag
runNonlinel -prefix Lagrange- ThickCyl-p2-h3.inp -UL -vtf 1 -nGauss 3 -lag
runNonlinel -prefix Lagrange- ThickCyl-p2-h4.inp -UL -vtf 1 -nGauss 3 -lag
runNonlinel ThickCyl-p2-h1.inp -UL -vtf 1 -nGauss 3 -nviz 3
runNonlinel ThickCyl-p2-h2.inp -UL -vtf 1 -nGauss 3 -nviz 3
runNonlinel ThickCyl-p2-h3.inp -UL -vtf 1 -nGauss 3 -nviz 3
runNonlinel ThickCyl-p2-h4.inp -UL -vtf 1 -nGauss 3 -nviz 3
runNonlinel -prefix Lagrange- ThickCyl_p3-h1.inp -UL -vtf 1 -lag
runNonlinel -prefix Lagrange- ThickCyl_p3-h2.inp -UL -vtf 1 -lag
runNonlinel -prefix Lagrange- ThickCyl_p3-h3.inp -UL -vtf 1 -lag
runNonlinel -prefix Lagrange- ThickCyl_p3-h4.inp -UL -vtf 1 -lag
runNonlinel ThickCyl_p3-h1.inp -UL -vtf 1 -nviz 3
runNonlinel ThickCyl_p3-h2.inp -UL -vtf 1 -nviz 3
runNonlinel ThickCyl_p3-h3.inp -UL -vtf 1 -nviz 3
runNonlinel ThickCyl_p3-h4.inp -UL -vtf 1 -nviz 3
runNonlinel -prefix Lagrange- ThickCyl-p3-h1.inp -UL -vtf 1 -lag
runNonlinel -prefix Lagrange- ThickCyl-p3-h2.inp -UL -vtf 1 -lag
runNonlinel -prefix Lagrange- ThickCyl-p3-h3.inp -UL -vtf 1 -lag
runNonlinel -prefix Lagrange- ThickCyl-p3-h4.inp -UL -vtf 1 -lag
runNonlinel ThickCyl-p3-h1.inp -UL -vtf 1 -nviz 3
runNonlinel ThickCyl-p3-h2.inp -UL -vtf 1 -nviz 3
runNonlinel ThickCyl-p3-h3.inp -UL -vtf 1 -nviz 3
runNonlinel ThickCyl-p3-h4.inp -UL -vtf 1 -nviz 3
runNonlinel -prefix Lagrange- ThickCyl_p4-h1.inp -UL -vtf 1 -nGauss 5 -lag
runNonlinel -prefix Lagrange- ThickCyl_p4-h2.inp -UL -vtf 1 -nGauss 5 -lag
runNonlinel -prefix Lagrange- ThickCyl_p4-h3.inp -UL -vtf 1 -nGauss 5 -lag
runNonlinel ThickCyl_p4-h1.inp -UL -vtf 1 -nviz 5
runNonlinel ThickCyl_p4-h2.inp -UL -vtf 1 -nviz 5
runNonlinel ThickCyl_p4-h3.inp -UL -vtf 1 -nviz 5
runNonlinel ThickCyl_p4-h4.inp -UL -vtf 1 -nviz 5
runNonlinel -prefix Lagrange- ThickCyl-p4-h1.inp -UL -vtf 1 -nGauss 5 -lag
runNonlinel -prefix Lagrange- ThickCyl-p4-h2.inp -UL -vtf 1 -nGauss 5 -lag
runNonlinel -prefix Lagrange- ThickCyl-p4-h3.inp -UL -vtf 1 -nGauss 5 -lag
runNonlinel ThickCyl-p4-h1.inp -UL -vtf 1 -nviz 5
runNonlinel ThickCyl-p4-h2.inp -UL -vtf 1 -nviz 5
runNonlinel ThickCyl-p4-h3.inp -UL -vtf 1 -nviz 5
