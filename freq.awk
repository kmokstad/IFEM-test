# $Id: freq.awk,v 1.2 2009-06-11 15:48:46 kmo Exp $

BEGIN { start = 0;
printf "#   NDOF\tMode_7\tMode_8\tMode_9\tMode_10\tMode_11\tMode_12\tMode_13\tMode_14\tMode_15\tMode_16\n"
}

/unknowns/ { printf "%8d",$4 }
/Frequency/ { start = NR+6 }
{ if (start > 0 && NR > start && NR - start < 11) printf "\t%.5g",$2 }
{ if (start > 0 && NR - start > 10) { start = 0; printf "\n" } }
