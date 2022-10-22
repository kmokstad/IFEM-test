/Number of elements/ { printf "%5d %5g ",$4,sqrt($4) }
/Number of nodes/ { printf "%5d %5g %5g",$4,sqrt($4),3*sqrt($4)-5 }
/Energy norm \|u\^h\|/ { printf " %s",$7 }
/External energy/ { printf " %s",$5 }
/sol1 =/ { printf " %s",$7 }
/sol3 =/ { printf " %s %s %s %s %s",$3,$4,$6,$7,$8 }
/sol4 =/ { printf " %s %s %s %s %s",$3,$4,$6,$7,$8 }
/Total time/ { printf "\n" }
