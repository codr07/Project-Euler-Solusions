(* 
 * Solution to Project Euler problem 112
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 *)


BouncyQ[n_] := Block[{d = IntegerDigits[n]},
  Block[{s = Sort[d]}, d != s && d != Reverse[s]]]

b = 0;
For[i = 1, True, i++,
  b += Boole[BouncyQ[i]];
  If[b / i == 99 / 100,
    Break[]]]
i
