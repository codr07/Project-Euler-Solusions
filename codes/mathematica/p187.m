(* 
 * Solution to Project Euler problem 187
 * Copyright (c) Sankha Saha. All rights reserved.
 * 
 *  
 *   
 *)


lim = 10^8;

SemiprimeQ[n_] := 3 <= DivisorSigma[0, i] <= 4 && !IntegerQ[i^(1/3)]
ans = 0;
For[i = 1, i < lim, i++,
  ans += Boole[SemiprimeQ[i]]]
ans
