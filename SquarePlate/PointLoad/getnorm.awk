/Number of elements/ { printf "%8d",$4 }
/Number of nodes/    { printf "%8d",$4 }
/Number of unknowns/ { printf "%8d",$4 }
/Energy norm \|u\^h/ { U=$7 }
/Energy norm       / { U=$5 }
/sol1 =/             { w=$5 }
/Error norm/         { e=$6 }
/Exact error.*u-u\^h/{ x=$6 }
/Exact error.*w-w\^h/{ x=$6 }
/ffectivity index   /{ f=$4 }
/Refined mesh:/      { printf "%22.15e%22.15e%22.15e%22.15e%6.3f\n",U,w,e,x,f }
/Profiling results / { printf "%22.15e%22.15e%22.15e%22.15e%6.3f\n",U,w,e,x,f }
