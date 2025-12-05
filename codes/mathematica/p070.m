(* 
 * Solution to Project Euler problem 70
 * Copyright (c) Sankha Saha. All rights reserved.
 * 
 *  
 *   
 *)


PermutationQ[x_, y_] := DigitCount[x] == DigitCount[y]
minVal = 0;
minArg = 0;
For[n = 2, n < 10^7, n++,
  Block[{tot = EulerPhi[n]},
    If[(minArg == 0 || n / tot < minVal) && PermutationQ[tot, n],
      minVal = n / tot;
      minArg = n]]]
minArg
