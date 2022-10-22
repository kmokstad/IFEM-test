CXXFLAGS = -std=c++11 -MD -MT -DHAS_BOOST -DHAS_GOTOOLS -DGOTOOLS_HAS_BASISDERIVS_SF3

crackIt : crackIt.o
	$(CXX) crackIt.o -o $@ -lLRSpline -lGoToolsCore

clean :
	-rm crackIt.d crackIt.o
