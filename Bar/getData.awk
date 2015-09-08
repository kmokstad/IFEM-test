BEGIN { nstep = 0; niter = 0; t = 0; i1 = 0; i2 = 0; i3 = 0; i4 = 0;
  printf "#step iter    time        P1:r_x             P2:d_x             P2:v_x             P2:a_x\n";
}

# Step number
# Number of iterations
# Time
# Reaction force in first result point
# Displacement of second result point
# Velocity of second result point
# Acceleration of second result point

/^\t*reac/ {
  if (++i1 == 1) {
    rx1 = $2;
  }
  else if (i1 == 2) {
    i1 = 0;
  }
}

/^ *[NP].*:\tsol1/ {
  if (++i2 == 2) {
    dx2 = $4;
    i2 = 0;
  }
}

/^ *[NP].*:\tvelocity/ {
  if (++i3 == 2) {
    vx2 = $4;
    i3 = 0;
  }
}

/^ *[NP].*:\tacceleration/ {
  if (++i4 == 2) {
    ax2 = $4;
    i4 = 0;
  }
}

/iter / { ++niter; }
/step / {
  if (nstep > 0) {
    printf "%5d%5d%14.6e", nstep, niter, t;
    printf "%19.11e%19.11e%19.11e%19.11e\n", rx1, dx2, vx2, ax2;
    niter = 0;
  }
  nstep = $2;
  t = $4;
}

END {
  printf "%5d%5d%14.6e", nstep, niter, t;
  printf "%19.11e%19.11e%19.11e%19.11e\n", rx1, dx2, vx2, ax2;
}
