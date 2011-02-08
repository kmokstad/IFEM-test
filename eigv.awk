# $Id: eigv.awk,v 1.1 2009-06-11 15:48:46 kmo Exp $

BEGIN { start = 0; pi = 3.14159265358979323846;
printf "#   NDOF\tMode_7\t\tMode_8\t\tMode_9\t\tMode_10\t\tMode_11\t\tMode_12\t\tMode_13\t\tMode_14\t\tMode_15\t\tMode_16\n"
}

/unknowns/ { printf "%8d",$4 }
/Frequency/ { start = NR+6 }
{ if (start > 0 && NR > start && NR - start < 11) printf "\t%.5g",0.25/(pi*pi*$2*$2) }
{ if (start > 0 && NR - start > 10) { start = 0; printf "\n" } }
