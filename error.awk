# $Id: error.awk,v 1.1 2010-03-17 15:46:12 kmo Exp $

BEGIN {
printf "#   NDOF\tExact_error\tRelative_error\n"
}

/unknowns/ { printf "%8d",$4 }
/Exact error/ { printf "\t%.5g",$6 }
/Exact relative/ { printf "\t%.5g\n",$6 }
