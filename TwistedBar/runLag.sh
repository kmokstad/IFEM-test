#!/bin/sh
# $Id: runLag.sh,v 1.1 2011-01-27 17:19:15 kmo Exp $
# Legend: Std - Standard displacement formulation
#         Mix - Mixed formulation with internal discontinuous pressure field

runNonlinel -prefix Std- TBar-h4x16-p1.inp -lagrange -UL -nGauss 2 -vtf 1 -saveInc 0.1
runNonlinel -prefix Mix- TBar-h4x16-p1.inp -lagrange -UL -MX 0 -nGauss 2 -vtf 1 -saveInc 0.1

runNonlinel -prefix Std- TBar-h2x8-p2.inp -lagrange -UL -nGauss 3 -vtf 1 -saveInc 0.1
runNonlinel -prefix Mix- TBar-h2x8-p2.inp -lagrange -UL -MX 1 -nGauss 3 -vtf 1 -saveInc 0.1

runNonlinel -prefix Std- TBar-h1x4-p4.inp -lagrange -UL -nGauss 5 -vtf 1 -saveInc 0.1
runNonlinel -prefix Mix- TBar-h1x4-p4.inp -lagrange -UL -MX 3 -nGauss 5 -vtf 1 -saveInc 0.1
