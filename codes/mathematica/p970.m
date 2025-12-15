LambertWBranch[z_, k_] :=
 FixedPoint[
  # - (# Exp[#] - z)/(Exp[#] (# + 1)) &,
  Log[Abs[z]] + I (Arg[z] + 2 Pi k),
  50
 ]
