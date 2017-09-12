BEGIN { stepline = 0; niter = 0; cb = 0; i = 0; j = 0; t0 = 0;
  ri = 61.3; t1 = 3.86; pi = 3.141592654;
  printf "#step iter cut-back   time   dt        P1:d_y    P2:d_y   RB1:r_x   RB1:r_y   RB2:r_x   RB2:r_y active1 active2";
  printf "     L2-norm       disp*R      energy  ext_energy stress_norm   pres_norm  dev_stress   von_mises";
  printf "   max_vonMises    x       r   theta     max_Epp       x       r   theta";
  printf "      max_T        x       r   theta      max_L        x       r   theta\n";
}

# Inkrement #,
# Antall iterasjoner,
# Antall cut-backs,
# Time,
# Incremental time,
# Displacements of first resultpoint,
# Displacements of second resultpoint,
# Total reactions for hhv RB1 and RB2,
# Antall active contact noder for hhv RB1 og RB2,
# Primary solution norm,
# Displacement*reactions,
# Energy norm,
# External exergy norm,
# Stress norm,
# pressure norm,
# Deviatoric stress norm,
# Stress norm von mises,
# maximum von Mises stress (value, location)
# maximum plastic strain (value, location),
# maximum stress triaxiality (value, location)
# maximum Lode parameter (value, location),

/cut-back/ { ++cb; }
/iter=/ { ++niter; }
/step/ { nstep = $2;
  t = $4; dt = t-t0;
}

/Primary solution summary:/ { ps = $6; t0 = t; }
/displacement.reactions/ { dr = $4 }
/Stress norm, L2/ { l2s = $6 }
/Stress norm, von Mises/ { vms = $7 }
/Pressure norm, L2/ { pres = $6 }
/Deviatoric stress/ { dev = $6 }
/Energy norm:/ { eni = $7 }
/External energy:/ { enx = $5 }
/Max von Mises/ { maxVMS = $5;
  xVMS = $8; y = $9; z = $10;
  rVMS = (ri + t1 - sqrt(y*y+z*z))/t1;
  tVMS = atan2(z,-y)*180/pi;
}
/Max E_pp/ { maxEpp = $3;
  xEpp = $6; y = $7; z = $8;
  rEpp = (ri + t1 - sqrt(y*y+z*z))/t1;
  tEpp = atan2(z,-y)*180/pi;
}
/Max T/ { maxT = $3;
  xT = $6; y = $7; z = $8;
  rT = (ri + t1 - sqrt(y*y+z*z))/t1;
  tT = atan2(z,-y)*180/pi;
}
/Max L/ { maxL = $3;
  xL = $6; y = $7; z = $8;
  rL = (ri + t1 - sqrt(y*y+z*z))/t1;
  tL = atan2(z,-y)*180/pi;
}

/[NP].* #[0-9]*:/ {
  if (++i == 1)
    d1 = $6;
  else if (i == 2) {
    d2 = $6;
    i = 0;
  }
}

/Total reactions.*1:/ { rx1 = $7; ry1 = $8; }
/Total reactions.*2:/ { rx2 = $7; ry2 = $8; stepline = NR; step = nstep; }

/active contact/ {
  if (++j == 1)
    c1 = $1;
  else if (j == 2) {
    c2 = $1;
    j = 0;
  }
  if (NR == stepline+8) {
    printf "%5d%5d%5d%11.4f%9.6f", step, niter, cb, t0, dt;
    printf "%19.11e%19.11e%19.11e%19.11e%19.11e%19.11e%8d%8d", d1, d2, rx1, ry1, rx2, ry2, c1, c2;
    printf "%19.11e%19.11e%19.11e%19.11e%19.11e%19.11e%19.11e%19.11e", ps, dr, eni, enx, l2s, pres, dev, vms;
    printf "%19.11e%8.2f%8.2f%8.2f", maxVMS, xVMS, rVMS, tVMS;
    printf "%19.11e%8.2f%8.2f%8.2f", maxEpp, xEpp, rEpp, tEpp;
    printf "%19.11e%8.2f%8.2f%8.2f", maxT, xT, rT, tT;
    printf "%19.11e%8.2f%8.2f%8.2f\n", maxL, xL, rL, tL;
    cb = 0; niter = 0;
  }
}

END {
  printf "%5d%5d%5d%11.4f%9.6f", nstep, niter, cb, t0, dt;
  printf "%19.11e%19.11e%19.11e%19.11e%19.11e%19.11e%8d%8d", d1, d2, rx1, ry1, rx2, ry2, c1, c2;
  printf "%19.11e%19.11e%19.11e%19.11e%19.11e%19.11e%19.11e%19.11e", ps, dr, eni, enx, l2s, pres, dev, vms;
  printf "%19.11e%8.2f%8.2f%8.2f", maxVMS, xVMS, rVMS, tVMS;
  printf "%19.11e%8.2f%8.2f%8.2f", maxEpp, xEpp, rEpp, tEpp;
  printf "%19.11e%8.2f%8.2f%8.2f", maxT, xT, rT, tT;
  printf "%19.11e%8.2f%8.2f%8.2f\n", maxL, xL, rL, tL;
}
