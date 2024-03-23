(* 
 * Solution to Project Euler problem 69
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 *)


maxVal = 0;
maxArg = 0;
For[n = 1, n <= 10^6, n++,
  Block[{val = n / EulerPhi[n]},
    If[val > maxVal,
      maxVal = val;
      maxArg = n]]]
maxArg
