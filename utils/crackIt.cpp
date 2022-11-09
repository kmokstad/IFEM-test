/*!
  Program to insert a C^{-1} line in a tensor spline and output it as a LR mesh.
  Requires that GoTools and LRSplines packages are installed.

  To compile (with gcc):

  $ cat << EOF > Makefile
CXXFLAGS = -std=c++11 -MD -MT -DHAS_BOOST -DHAS_GOTOOLS -DGOTOOLS_HAS_BASISDERIVS_SF3

crackIt : crackIt.o
	$(CXX) crackIt.o -o $@ -lLRSpline -lGoToolsCore
EOF
  $ make
*/

#include "GoTools/geometry/ObjectHeader.h"
#include "GoTools/geometry/SplineSurface.h"
#include "LRSpline/LRSplineSurface.h"
#include <fstream>
#include <iostream>
#include <cstring>


int main (int argc, char** argv)
{
  if (argc < 2)
  {
    std::cout <<"usage: "<< argv[0]
              <<" <g2-file> [<lr-file>] [-u <u> <v0> <v1>|-v <v> <u0> <u1>][-c <cont>]\n";
    return 0;
  }

  Go::ObjectHeader head;
  Go::SplineSurface srf;
  std::ifstream is(argv[1]);
  if (!is)
  {
    std::cerr <<" *** No such file "<< argv[1] <<"\n";
    return 1;
  }

  try
  {
    is >> head >> srf;
    is.close();
  }
  catch (const std::exception& e)
  {
    std::cerr <<" *** Failure reading spline data from "<< argv[1] <<"\n";
    return 1;
  }

  int dir = 0, p = 0, C = -1;
  if (argc > 7 && !strcmp(argv[argc-2],"-c"))
  {
    // Get continuity to insert (default -1)
    C = atoi(argv[argc-1]);
    argc -= 2;
  }

  if (argc > 5)
    if (!strcmp(argv[argc-4],"-u"))
    {
      dir = 1; // make C^-1 line in u-direction
      p = srf.order_v();
    }
    else if (!strcmp(argv[argc-4],"-v"))
    {
      dir = 2; // make C^-1 line in v-direction
      p = srf.order_u();
    }
    else if (!strcmp(argv[argc-4],"-uv"))
    {
      dir = 3; // make C^-1 line in both directions
      p = std::max(srf.order_u(),srf.order_v());
    }

  int multiplicity = p-C; // multiplicity p+1 <=> C^{-1} line
  if (multiplicity < 1) return 2;

  double u[3];
  if (dir > 0)
  {
    for (int i = 2; i >= 0; i--)
      u[i] = atof(argv[--argc]);
    --argc;
    std::cout <<"   * Inserting C^"<< C <<" line in "<< char('t'+dir) <<"-direction:";
    for (int i = 0; i < 3; i++) std::cout <<" "<< u[i];
    std::cout << std::endl;
  }

  LR::LRSplineSurface lr(&srf);
  if (dir == 2 || dir == 3) // v-direction
    lr.insert_const_u_edge(u[0],       // u = u0 = constant
                           u[1], u[2], // v \in [u1, u2]
                           multiplicity);
  if (dir == 1 || dir == 3) // u-direction
    lr.insert_const_v_edge(u[0],       // v = u0 = constant
                           u[1], u[2], // v \in [u1, u2]
                           multiplicity);

  char* lrfile = strcat(strtok(strdup(argc > 2 ? argv[2] : argv[1]),"."),".lr");
  std::cout <<"   * Writing LR-mesh to "<< lrfile << std::endl;
  std::ofstream os(lrfile);
  os << lr;

  char* psfile = strcat(strtok(lrfile,"."),".eps");
  std::cout <<"   * Writing LR-mesh to "<< psfile << std::endl;
  std::ofstream eps(psfile);
  lr.writePostscriptMesh(eps);

  return 0;
}
