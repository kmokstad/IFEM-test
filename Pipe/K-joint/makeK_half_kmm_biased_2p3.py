
from math import *
from GoTools import *
from GoTools.CurveFactory import *
from GoTools.SurfaceFactory import *
from GoTools.VolumeFactory import *
from GeoUtils.Refinement import *
from GeoUtils.Elementary import *
from GeoUtils.Factory import *

########################################

#######     Initial parameters    ######

########################################

SetFinalOutput(file="K_half_kmm_biased_2p3.g2")

# convenience variables for the axes
o = Point(0,0,0)
x = Point(1,0,0)
y = Point(0,1,0)
z = Point(0,0,1)

# problem parameters
SetTolerance('gap', 1e-1) # tolerance level for intersection curve (as by GoTools)
resampleN = 15            # tolerance level for intersection curve (from geomod resampling)
R     = 498.6/2  # radius of big pipe
r     = 356.5/2  # radius of small pipe
T     = 10       # thickness of big pipe
t     = 9.3      # thickness of small pipe
d     = -28      # z-value of intersection point between small pipes
Lleft = 1800     # length of big pipe to the left
Lright= 1500     # length of big pipe to the right
lleft = 1550     # length of small pipe to the left
lright= 1800     # length of small pipe to the right
refine='biased'  # refinement scheme: 'biased', 'uniform' or 'none'
q     = 4        # orden = polynomial degree of basis functions + 1
b1    = 0.9      # bias factor
b2    = 0.9      # bias factor
b3    = 0.9      # bias factor
n1    = 16       # # of new knots
n2    = 16       # # of new knots
n3    = 16       # # of new knots
theta = 2*pi/3


# make cylinders to do the intersections with
mainIn        = CylinderSurface(o, x, R-T/2.0)
mainOut       = CylinderSurface(o, x, R+T/2.0)
smallLeftIn   = CylinderSection(o + d*z, z-x, r-t/2.0, lleft,  0, pi)
smallLeftOut  = CylinderSection(o + d*z, z-x, r+t/2.0, lleft,  0, pi)
smallRightIn  = CylinderSection(o + d*z, z+x, r-t/2.0, lright, 0, pi)
smallRightOut = CylinderSection(o + d*z, z+x, r+t/2.0, lright, 0, pi)


# create the 4 interesection curves for left side and right side
leftInIn   = IntersectCylinder(smallLeftIn, mainIn)
leftInIn   = leftInIn[0][0].Rebuild(resampleN, q) # only interested in intersection CURVES, and only the first one
leftInOut  = IntersectCylinder(smallLeftIn, mainOut)
leftInOut  = leftInOut[0][0].Rebuild(resampleN, q)
leftOutIn  = IntersectCylinder(smallLeftOut, mainIn)
leftOutIn  = leftOutIn[0][0].Rebuild(resampleN, q)
leftOutOut = IntersectCylinder(smallLeftOut, mainOut)
leftOutOut = leftOutOut[0][0].Rebuild(resampleN, q)

rightInIn   = IntersectCylinder(smallRightIn, mainIn)
rightInIn   = rightInIn[0][0].Rebuild(resampleN, q) # only interested in intersection CURVES, and only the first one
rightInOut  = IntersectCylinder(smallRightIn, mainOut)
rightInOut  = rightInOut[0][0].Rebuild(resampleN, q)
rightOutIn  = IntersectCylinder(smallRightOut, mainIn)
rightOutIn  = rightOutIn[0][0].Rebuild(resampleN, q)
rightOutOut = IntersectCylinder(smallRightOut, mainOut)
rightOutOut = rightOutOut[0][0].Rebuild(resampleN, q)

allIntersect  = [leftOutIn, leftOutOut, rightOutIn, rightOutOut]
isInMain      = [True,      False,      True,       False,    ]

surf = []

# make the HORRIBLE parametrization which is given by RotationalCrv2CrvSweep
for i in range(len(allIntersect)):
	cr = allIntersect[i]
	cb = cr.Clone()
	cb.Project('x')
	if(isInMain[i]):
		cb = Translate(cb, (R-T/2.0)*(Point(0, sin(-theta), cos(-theta))) )
	else:
		cb = Translate(cb, (R+T/2.0)*(Point(0, sin(-theta), cos(-theta))) )

	surf.append(RotationalCrv2CrvSweep(cr, cb, 0))

surf.append(LoftCurves([leftInIn,   leftOutIn])  )
surf.append(LoftCurves([leftInOut,  leftOutOut]) )
surf.append(LoftCurves([rightInIn,  rightOutIn]) )
surf.append(LoftCurves([rightInOut, rightOutOut]))

# create all the halfcircle curves at the connections and endpoints
stXLeftoo   = leftOutOut[0][0] # the x-component of the left intersection
stXLeftoi   = leftOutIn[0][0] 
stX1Leftoo  = leftOutOut[-1][0] 
stX1Leftoi  = leftOutIn[-1][0] 
stXRightoo  = rightOutOut[0][0] # the x-component of the right intersection
stXRightoi  = rightOutIn[0][0] 
stX1Rightoo = rightOutOut[-1][0]
stX1Rightoi = rightOutIn[-1][0] 

endLeftIn   = CircleSegment(-Lleft*x,      -Lleft*x      + (R-T/2.0)*z, theta, x)
endLeftOut  = CircleSegment(-Lleft*x,      -Lleft*x      + (R+T/2.0)*z, theta, x)
endRightIn  = CircleSegment( Lright*x,     Lright*x      + (R-T/2.0)*z, theta, x)
endRightOut = CircleSegment( Lright*x,     Lright*x      + (R+T/2.0)*z, theta, x)
leftoo      = CircleSegment(stXLeftoo*x,   stXLeftoo*x   + (R+T/2.0)*z, theta, x)
leftoi      = CircleSegment(stXLeftoi*x,   stXLeftoi*x   + (R-T/2.0)*z, theta, x)
rightoo     = CircleSegment(stXRightoo*x,  stXRightoo*x  + (R+T/2.0)*z, theta, x)
rightoi     = CircleSegment(stXRightoi*x,  stXRightoi*x  + (R-T/2.0)*z, theta, x)
left1oo     = CircleSegment(stX1Leftoo*x,  stX1Leftoo*x  + (R+T/2.0)*z, theta, x)
left1oi     = CircleSegment(stX1Leftoi*x,  stX1Leftoi*x  + (R-T/2.0)*z, theta, x)
right1oo    = CircleSegment(stX1Rightoo*x, stX1Rightoo*x + (R+T/2.0)*z, theta, x)
right1oi    = CircleSegment(stX1Rightoi*x, stX1Rightoi*x + (R-T/2.0)*z, theta, x)

endSmallLeftOut  = CircleSegment( (d+lleft)*z,  (d+lleft)*z  + (r+t/2.0)*x, -pi, z)
endSmallLeftIn   = CircleSegment( (d+lleft)*z,  (d+lleft)*z  + (r-t/2.0)*x, -pi, z)
endSmallRightOut = CircleSegment( (d+lright)*z, (d+lright)*z + (r+t/2.0)*x, -pi, z)
endSmallRightIn  = CircleSegment( (d+lright)*z, (d+lright)*z + (r-t/2.0)*x, -pi, z)
endSmallLeftOut  = Rotate( endSmallLeftOut  , y,  pi/4)
endSmallLeftIn   = Rotate( endSmallLeftIn   , y,  pi/4)
endSmallRightOut = Rotate( endSmallRightOut , y, -pi/4)
endSmallRightIn  = Rotate( endSmallRightIn  , y, -pi/4)
endSmallLeftOut.FlipParametrization()
endSmallLeftIn.FlipParametrization()

surf.append(LoftCurves([endSmallLeftIn,  endSmallLeftOut ] ) )
surf.append(LoftCurves([leftInOut,       leftOutOut]       ) )
surf.append(LoftCurves([endSmallRightIn, endSmallRightOut] ) )
surf.append(LoftCurves([rightInOut,      rightOutOut]      ) )

surf.append(LoftCurves([endLeftIn,  endLeftOut]))
surf.append(LoftCurves([leftoi,     leftoo]))
surf.append(LoftCurves([endRightIn, endRightOut]))
surf.append(LoftCurves([rightoi,    rightoo]))
surf.append(LoftCurves([left1oi,    left1oo]))
surf.append(LoftCurves([right1oi,   right1oo]))

vol = []
for i in range(0,len(surf),2):
	surf[ i ].ForceRational()
	surf[i+1].ForceRational()
	vol.append(LoftSurfaces([surf[i], surf[i+1]]))
	vol[-1].MakeRHS()

resultCurves = [leftInIn,  leftInOut,
                leftOutIn, leftOutOut,
				endLeftIn, endLeftOut,
				leftoi,    leftoo]


SetTolerance('refine', 1e-2) # to ignore refining the existing guy at the C0-line
if refine == 'uniform':
	# increase order to make it cubic everywhere
	for v in vol:
		p   = v.GetOrder()
		inc = [q-p[0], q-p[1], q-p[2]] 
	        v.RaiseOrder(inc[0], inc[1], inc[2])
	
	# refine to make it close to uniform
	UniformVolume(vol[0], 1, 3)
	UniformVolume(vol[1], 1, 3)
	UniformVolume(vol[6], 1, 3)
	UniformVolume(vol[7], 1, 3)
	UniformVolume(vol[8], 1, 3)
	
	UniformVolume(vol[6], 3, 7)
	UniformVolume(vol[7], 3, 7)
	
	UniformVolume(vol[4], 3, 7)
	UniformVolume(vol[5], 3, 7)
elif refine == 'biased':
	# increase order to make it cubic everywhere
	for v in vol:
		p   = v.GetOrder()
		inc = [q-p[0], q-p[1], q-p[2]] 
	        v.RaiseOrder(inc[0], inc[1], inc[2])
	
	GeometricRefineVolume(vol[0], -1, b1, n1)
#	GeometricRefineVolume(vol[1], -1, b1, n1)
#	GeometricRefineVolume(vol[6], +1, b1, n1)
#	GeometricRefineVolume(vol[7], +1, b1, n1)
#	GeometricRefineVolume(vol[8], -1, b1, n1)
	
	GeometricRefineVolume(vol[6], -3, b2, n2)
	GeometricRefineVolume(vol[7], +3, b2, n2)
	
	GeometricRefineVolume(vol[4], +3, b3, n3)
	GeometricRefineVolume(vol[5], -3, b3, n3)

# let all refinements propegate so that they make a matching model
model = VolumeModel(vol)
model.MakeCommonSplineSpace()

# dump results to file
FinalOutput(vol, True)

