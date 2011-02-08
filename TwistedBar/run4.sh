#!/bin/sh
# $Id: run4.sh,v 1.2 2011-01-28 16:59:31 kmo Exp $
#
# Legend: p<p> - Polynomial degree of the displacement basis functions is <p>
#         h<m>x<n> - Number of knot-span elements is <m> in cross section directions
#                    and <n> in the length direction (i.e. over all patches)
#         -UL 11 - Updated Lagrangian formulation using material version 11
#         -MX <p> - Polynomial degree of the incompatible pressure field is <p>
#         -nGauss <g> - Number of Quadrature points in each direction over a knot-span
#         -vtf 1 - Output Binary VTF-files
#         -saveInc 0.1 Time increment between each save to VTF

runNonlinel TBar4-p2-h7x28.inp -UL 11 -MX 1 -nGauss 3 -vtf 1 -saveInc 0.1

runNonlinel TBar4-p2-h15x60.inp -UL 11 -MX 1 -nGauss 3 -vtf 1 -saveInc 0.1

runNonlinel TBar4-p1-h16x64.inp -UL 11 -MX 0 -nGauss 2 -vtf 1 -saveInc 0.1
