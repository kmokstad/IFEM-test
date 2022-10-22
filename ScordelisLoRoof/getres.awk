/Number of elements/ { printf "%8d",$4 }
/Number of nodes/    { printf "%8d",$4 }
/Number of unknowns/ { printf "%8d",$4 }
/Energy norm       / { printf "%16.10f",$5 }
/Energy norm \|u\^h/ { printf "%16.10f",$7 }
/External energy/    { printf "%16.10f",$5 }
/- relative error/   { if ((++i)%3 == 1) printf "%14.10f\n",$8 }
