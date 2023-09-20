/*!
  This computes the deflection in the center of a simply supported square
  plate with unit side length, subjected to a central point load.
  See eq. (5.13) in T.Gustafsson, R.Stenberg, J.Videman,
  A POSTERIORI ESTIMATES FOR CONFORMING KIRCHHOFF PLATE ELEMENTS.
  Implementation using quad precision variables (128-bit).
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

  const long double D = E*d*d*d/(12.0*(1.0-nu*nu));
  const long double pi = acosl((long double)-1);

  int m, converged = 0;
  bool lower = true;
  long double one = 1.0;
  long double sum = 0.0;
  for (m = 1; m <= M && converged < 5; m += 2)
  {
    long double dm = (long double)m;
    long double m3 = one/(dm*dm*dm);
    if (lower)
    {
      long double mPI = dm*pi;
      long double uh = (sinhl(mPI) - mPI)/(one+coshl(mPI));
      if (uh == one) lower = false;
      sum += uh*m3;
    }
    else // the fraction uh equals one for this m and beyond
    {
      if (sum+m3 == sum) converged++;
      sum += m3;
    }
  }

  std::cout.precision(15);
  std::cout << 0.5*F0*sum/(D*pi*pi*pi) << std::endl;
  std::cout <<"Computed from "<< m/2 <<" Fourier terms";
  if (converged) std::cout <<" (converged)";
  std::cout << std::endl;
  return 0;
}
