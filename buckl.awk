# $Id: buckl.awk,v 1.1 2009-10-15 18:25:55 kmo Exp $

BEGIN { start = 0;
printf "#   NDOF\tMode_1\t\tMode_2\t\tMode_3\t\tMode_4\t\tMode_5\t\tMode_6\t\tMode_7\t\tMode_8\t\tMode_9\t\tMode_10\n"
}

/unknowns/ { printf "%8d",$4 }
/Eigenvalue$/ { start = NR }
{ if (start > 0 && NR > start && NR - start < 11) printf "\t%.5g",$2 }
{ if (start > 0 && NR - start > 10) { start = 0; printf "\n" } }
