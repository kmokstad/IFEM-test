"""
Generate splines mesh for different versions of the Scordelis-Lo test case.
"""

from splipy.curve_factory import circle_segment
from splipy.surface_factory import extrude
from splipy.io import G2
from math import sqrt, sin, pi


def ScordelisLo(R, L):
    """Generate the Scordelis-Lo shell geometry"""
    beta = 40*pi/180
    w = 2*R*sin(beta)
    y0 = -sqrt(R*R - w*w/4)
    arch = circle_segment(2*beta, R, center=[0, 0, 0], normal=[0,-1, 0])
    arch.rotate(pi/2-beta,normal=[0,-1, 0])
    arch.translate([0, y0, 0])
    return extrude(arch,amount=[0, L, 0]).swap()


def make_quadratics():
    # Create a NURBS surface with 1 quadratic/linear element (21 Feb 2019)
    surf = ScordelisLo(25,50)
    with G2('scordelis-lo-N2.g2') as output:
        output.write(surf)

    # Create a spline surface with 2x2 quadratic elements (21 Feb 2019)
    surf = surf.rebuild(p=(3,3),n=(4,4)).reparam()
    with G2('scordelis-lo-s2.g2') as output:
        output.write(surf)

def make_cubics():
    # Create a spline surface with 6x6 cubic elements (11 Dec 2018)
    surf = ScordelisLo(25,50).rebuild(p=(4,4),n=(9,9))
    #surf.reparam()
    with G2('scordelis-lo-s3.g2') as output:
        output.write(surf)

    # Create a spline surface (6x6 cubic elements)
    # with reduced continuity along the orthogonal center lines (12 Feb 2019)
    surf.reparam()
    surf.insert_knot(0.5,0)
    surf.insert_knot(0.5,1)

    with G2('scordelis-lo-s3r1.g2') as output:
        output.write(surf)

    # Create a NURBS surface (2x2 cubic elements)
    # with reduced continuity along the orthogonal center lines (11 Dec 2018)
    surf = ScordelisLo(25,50)
    surf.raise_order(1,0)

    u = surf.knots(0)
    v = surf.knots(1)
    u0 = 0.5*(u[0]+u[len(u)-1])
    v0 = 0.5*(v[0]+v[len(v)-1])
    print(u0)
    print(v0)

    surf.insert_knot(u0,direction=0)
    surf.insert_knot(v0,direction=1)
    surf.raise_order(1)

    with G2('scordelis-lo-N3r1.g2') as output:
        output.write(surf)


if __name__ == "__main__":
    make_quadratics()
    make_cubics()
