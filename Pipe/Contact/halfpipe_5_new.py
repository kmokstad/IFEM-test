from GoTools import *
from GoTools.CurveFactory import *
from GoTools.SurfaceFactory import *
from GoTools.VolumeFactory import *
from math import *

SetDimension(3)
SetFinalOutput("pipes.g2")

# Input parameters
L0 = 44.0
L1 = 450.0
L2 = 6.0
L3 = 10.0
L4 = 140.0
Ri = 61.2999992
t1 = 3.8600045
t2 = 9.7599984

x_axis   = Point(1,0,0)
y_axis   = Point(0,1,0)
center_0 = Point( 0,            0,0)
center_1 = Point(L0,            0,0)
center_2 = Point(L0+L1,         0,0)
center_3 = Point(L0+L1+L2,      0,0)
center_4 = Point(L0+L1+L2+L3,   0,0)
center_5 = Point(L0+L1+L2+L3+L4,0,0)


# first create all circular arcs
circ0_in  = CircleSegment(center_0, center_0 + Ri*y_axis,      pi, x_axis);
circ0_out = CircleSegment(center_0, center_0 + (Ri+t1)*y_axis, pi, x_axis);
circ1_in  = CircleSegment(center_1, center_1 + Ri*y_axis,      pi, x_axis);
circ1_out = CircleSegment(center_1, center_1 + (Ri+t1)*y_axis, pi, x_axis);
circ2_in  = CircleSegment(center_2, center_2 + Ri*y_axis,      pi, x_axis);
circ2_out = CircleSegment(center_2, center_2 + (Ri+t1)*y_axis, pi, x_axis);
circ3_in  = CircleSegment(center_3, center_3 + Ri*y_axis,      pi, x_axis);
circ3_out = CircleSegment(center_3, center_3 + (Ri+t2)*y_axis, pi, x_axis);
circ4_in  = CircleSegment(center_4, center_4 + Ri*y_axis,      pi, x_axis);
circ4_out = CircleSegment(center_4, center_4 + (Ri+t2)*y_axis, pi, x_axis);
circ5_in  = CircleSegment(center_5, center_5 + Ri*y_axis,      pi, x_axis);
circ5_out = CircleSegment(center_5, center_5 + (Ri+t2)*y_axis, pi, x_axis);

# Interpolate surfaces between curves
face_0_in  = LoftCurves([circ0_in, circ1_in])
face_0_out = LoftCurves([circ0_out,circ1_out])
face_1_in  = LoftCurves([circ1_in, circ2_in])
face_1_out = LoftCurves([circ1_out,circ2_out])
face_2_in  = LoftCurves([circ2_in, circ3_in])
face_2_out = LoftCurves([circ2_out,circ3_out])
face_3_in  = LoftCurves([circ3_in, circ4_in])
face_3_out = LoftCurves([circ3_out,circ4_out])
face_4_in  = LoftCurves([circ4_in, circ5_in])
face_4_out = LoftCurves([circ4_out,circ5_out])

# Interpolate solids 
pipe_0 = LoftSurfaces([face_0_in, face_0_out])
pipe_1 = LoftSurfaces([face_1_in, face_1_out])
pipe_2 = LoftSurfaces([face_2_in, face_2_out])
pipe_3 = LoftSurfaces([face_3_in, face_3_out])
pipe_4 = LoftSurfaces([face_4_in, face_4_out])

FinalOutput([pipe_0, pipe_1, pipe_2, pipe_3, pipe_4], True)
