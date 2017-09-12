from GoTools import *
from GoTools.CurveFactory import *
from GoTools.SurfaceFactory import *
from GoTools.VolumeFactory import *
from math import *

# Input parameters
L0 = 10.0
L1 = 494.0
L2 = 6.0
L3 = 5.0
L4 = 145.0
Ri = 61.2999992
t1 = 3.8600045
t2 = 9.7599984

theta = pi/4

x_axis   = Point(1,0,0)
y_axis   = Point(0,1,0)
center_0 = Point( 0,         0,0)
center_1 = Point(L0,         0,0)
center_2 = Point(L1,         0,0)
center_3 = Point(L1+L2,      0,0)
center_4 = Point(L1+L2+L3,   0,0)
center_5 = Point(L1+L2+L3+L4,0,0)

def MakePipes(theta, theta0):
  so = [0, Ri*cos(theta0), Ri*sin(theta0)]
  so1 = [0, (Ri+t1)*cos(theta0), (Ri+t1)*sin(theta0)]
  so2 = [0, (Ri+t2)*cos(theta0), (Ri+t2)*sin(theta0)]
  circ0_in_1   = CircleSegment(center_0, center_0 + so,  theta, x_axis)
  circ0_out_1  = CircleSegment(center_0, center_0 + so1, theta, x_axis)
  circ1_in_1   = CircleSegment(center_1, center_1 + so,  theta, x_axis)
  circ1_out_1  = CircleSegment(center_1, center_1 + so1, theta, x_axis)
  circ2_in_1   = CircleSegment(center_2, center_2 + so,  theta, x_axis)
  circ2_out_1  = CircleSegment(center_2, center_2 + so1, theta, x_axis)
  circ3_in_1   = CircleSegment(center_3, center_3 + so,  theta, x_axis)
  circ3_out_1  = CircleSegment(center_3, center_3 + so2, theta, x_axis)
  circ4_in_1   = CircleSegment(center_4, center_4 + so,  theta, x_axis)
  circ4_out_1  = CircleSegment(center_4, center_4 + so2, theta, x_axis)
  circ5_in_1   = CircleSegment(center_5, center_5 + so,  theta, x_axis)
  circ5_out_1  = CircleSegment(center_5, center_5 + so2, theta, x_axis)

  # Interpolate surfaces between curves
  face_0_in_1  = LoftCurves([circ0_in_1,  circ1_in_1])
  face_0_out_1 = LoftCurves([circ0_out_1,  circ1_out_1])
  face_1_in_1  = LoftCurves([circ1_in_1,  circ2_in_1])
  face_1_out_1 = LoftCurves([circ1_out_1, circ2_out_1])
  face_2_in_1  = LoftCurves([circ2_in_1, circ3_in_1])
  face_2_out_1 = LoftCurves([circ2_out_1,circ3_out_1])
  face_3_in_1  = LoftCurves([circ3_in_1, circ4_in_1])
  face_3_out_1 = LoftCurves([circ3_out_1,circ4_out_1])
  face_4_in_1  = LoftCurves([circ4_in_1, circ5_in_1])
  face_4_out_1 = LoftCurves([circ4_out_1,circ5_out_1])

  # Interpolate solids 
  pipe_0 = LoftSurfaces([face_0_in_1, face_0_out_1])
  pipe_1 = LoftSurfaces([face_1_in_1, face_1_out_1])
  pipe_2 = LoftSurfaces([face_2_in_1, face_2_out_1])
  pipe_3 = LoftSurfaces([face_3_in_1, face_3_out_1])
  pipe_4 = LoftSurfaces([face_4_in_1, face_4_out_1])

  return [pipe_0, pipe_1, pipe_2, pipe_3, pipe_4]

SetDimension(3)
SetFinalOutput("pipes.g2")

patches = MakePipes(theta,0)
patches += MakePipes(pi-theta,theta)

FinalOutput(patches, True)
