(* 
 * Solution to Project Euler problem 429
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 *)


num = 10^8;
md = 1000000009;

CountFactors[n_, p_] := If[n == 0, 0, Floor[n / p] + CountFactors[Floor[n / p], p]]

s = 1;
For[i = 1, Prime[i] <= num, i++,
  s = Mod[(PowerMod[Prime[i], CountFactors[num, Prime[i]] * 2, md] + 1) * s, md]]
s
