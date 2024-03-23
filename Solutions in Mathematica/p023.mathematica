(* 
 * Solution to Project Euler problem 23
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 *)


lim = 28123;

isAbundant = Table[DivisorSigma[1, n] - n > n, {n, lim}];
abundants = Pick[Range[lim], isAbundant];
NotSumOfTwoAbundantsQ[n_] := Block[{i},
  For[i = 1, i < Length[abundants] && abundants[[i]] < n, i++,
    If[isAbundant[[n - abundants[[i]]]],
      Return[False]]];
  True]

Total[Select[Range[lim], NotSumOfTwoAbundantsQ]]
