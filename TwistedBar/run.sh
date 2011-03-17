#!/bin/sh
# $Id: run.sh,v 1.1 2011-01-27 17:19:15 kmo Exp $
# Legend: Std - Standard displacement formulation
#         Mix - Mixed formulation with internal discontinuous pressure field
#         Mixed - Mixed formulation with continuous pressure/volumetric change field

runNonlinel -prefix Std- TBar-p1-h4x16.inp -UL -nGauss 2 -vtf 1 -nviz 3 -saveInc 0.1
runNonlinel -prefix Mix- TBar-p1-h4x16.inp -UL -MX 0 -nGauss 2 -vtf 1 -nviz 3 -saveInc 0.1

runNonlinel -prefix Std- TBar-p2-h3x15.inp -UL -nGauss 3 -vtf 1 -nviz 4 -saveInc 0.1
runNonlinel -prefix Mix- TBar-p2-h3x15.inp -UL -MX 1 -nGauss 3 -vtf 1 -nviz 4 -saveInc 0.1
runNonlinel -prefix Mixed- TBar-p1-h2x8.inp -UL -mixed -nGauss 3 -vtf 1 -nviz 5 -saveInc 0.1

runNonlinel -prefix Std- TBar-p3-h2x14.inp -UL -nGauss 4 -vtf 1 -nviz 5 -saveInc 0.1
runNonlinel -prefix Mix- TBar-p3-h2x14.inp -UL -MX 2 -nGauss 4 -vtf 1 -nviz 5 -saveInc 0.1

runNonlinel -prefix Std- TBar-p4-h1x13.inp -UL -nGauss 5 -vtf 1 -nviz 9 -saveInc 0.1
runNonlinel -prefix Mix- TBar-p4-h1x13.inp -UL -MX 3 -nGauss 5 -vtf 1 -nviz 9 -saveInc 0.1
runNonlinel -prefix Mixed- TBar-p3-h1x7.inp -UL -mixed -nGauss 5 -vtf 1 -nviz 9 -saveInc 0.1
