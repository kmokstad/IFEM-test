/*!
  This computes the deflection in the center of a simply supported square
  plate with unit side length, subjected to a central point load.
  See eq. (5.13) in T.Gustafsson, R.Stenberg, J.Videman,
  A POSTERIORI ESTIMATES FOR CONFORMING KIRCHHOFF PLATE ELEMENTS.
*/

#include <iostream>
#include <cstdlib>
#include <cmath>


int main (int argc, const char** argv)
{
  const int M = argc > 1 ? atoi(argv[1]) : 1000000; // Number of Fourier terms

  double F0 = argc > 2 ? atof(argv[2]) : 1.0; // Load value
  double d  = argc > 3 ? atof(argv[3]) : 1.0; // Plate thickness
  double E  = argc > 4 ? atof(argv[4]) : 1.0; // Youngs modulus
  double nu = argc > 5 ? atof(argv[5]) : 0.3; // Poisson ratio
  double D  = E*d*d*d/(12.0*(1.0-nu*nu));     // Plate constant

  double sum = 0.0;
  for (int m = 1; m <= M; m += 2)
    if (m > 200)
      sum += pow(m,-3.0);
    else
      sum += (sinh(m*M_PI) - m*M_PI)*pow(m,-3.0)/(1.0+cosh(m*M_PI));

  std::cout.precision(16);
  std::cout << 0.5*F0*sum/(D*pow(M_PI,3.0)) << std::endl;
  return 0;
}
