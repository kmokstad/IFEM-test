#!/bin/sh
# $Id: run.sh,v 1.1 2011-01-05 19:17:58 kmo Exp $

runSplineSol -prefix Lin- CurvedBeam-p2-h1.inp -vtf 1 -2D
runSplineSol -prefix Lin- CurvedBeam-p2-h2.inp -vtf 1 -2D
runSplineSol -prefix Lin- CurvedBeam-p2-h3.inp -vtf 1 -2D
runSplineSol -prefix Lin- CurvedBeam-p2-h4.inp -vtf 1 -2D
runSplineSol -prefix Lin- CurvedBeam-p2-h5.inp -vtf 1 -2D
runNonlinel -prefix NL- CurvedBeam-p2-h1.inp -vtf 1 -2D -UL
runNonlinel -prefix NL- CurvedBeam-p2-h2.inp -vtf 1 -2D -UL
runNonlinel -prefix NL- CurvedBeam-p2-h3.inp -vtf 1 -2D -UL
runNonlinel -prefix NL- CurvedBeam-p2-h4.inp -vtf 1 -2D -UL
runNonlinel -prefix NL- CurvedBeam-p2-h5.inp -vtf 1 -2D -UL

runSplineSol -prefix Lin- CurvedBeam-p3-h1.inp -vtf 1 -2D
runSplineSol -prefix Lin- CurvedBeam-p3-h2.inp -vtf 1 -2D
runSplineSol -prefix Lin- CurvedBeam-p3-h3.inp -vtf 1 -2D
runSplineSol -prefix Lin- CurvedBeam-p3-h4.inp -vtf 1 -2D
runSplineSol -prefix Lin- CurvedBeam-p3-h5.inp -vtf 1 -2D
runNonlinel -prefix NL- CurvedBeam-p3-h1.inp -vtf 1 -2D -UL
runNonlinel -prefix NL- CurvedBeam-p3-h2.inp -vtf 1 -2D -UL
runNonlinel -prefix NL- CurvedBeam-p3-h3.inp -vtf 1 -2D -UL
runNonlinel -prefix NL- CurvedBeam-p3-h4.inp -vtf 1 -2D -UL
runNonlinel -prefix NL- CurvedBeam-p3-h5.inp -vtf 1 -2D -UL
