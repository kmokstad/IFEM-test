"""
Generate splines mesh for different versions of the Scordelis-Lo test case.
"""

from scordelislo import ScordelisLo
from splipy.io import G2
from sys import argv


argc = len(argv)
p = int(argv[1]) if argc > 1 else 2
h = int(argv[2]) if argc > 2 else 4
# Create a spline surface with {h}x{h} elements of order {p}
file = f"scordelis-lo-s{p}-{h}x{h}.g2"
print("Creating", file)
surf = ScordelisLo(25,50).rebuild(p=(p+1,p+1),n=(h+p,h+p)).reparam()
with G2(file) as output:
    output.write(surf)
