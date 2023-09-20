# Define some convenience functions for plotting the errors.
################################################################################
# Exact solution for the displacement under the point load, Wref = w(0.5,0.5),
# calculated from the Navier thin-plate solution.
# With the point load value Pz equal to 1.0, this will equal the strain energy
# of the exact solution, a(w,w) = l(w) = Pz*w(0.5,0.5) = w(0.5,0.5).
Wref = 0.12668117031255
# Relative exact error (in % of the exact strain energy),
# calculated from the displacement under the point load (w)
Wrel(w) = sqrt(abs(w/Wref-1.0))*100.0
# Relative exact error (in % of the exact strain energy),
# calculated from the integrated strain energy from the FE solution (u)
Erel(u) = Wrel(u*u)
# Relative estimated error (in % of the exact energy)
Rele(e) = 100.0*e/sqrt(Wref)
# Effectivity index
Eff(e,w) = e/sqrt(abs(w-Wref))
