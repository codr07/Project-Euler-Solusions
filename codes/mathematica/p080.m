(* 
 * Solution to Project Euler problem 80
 * Copyright (c) Sankha Saha. All rights reserved.
 * 
 *  
 *   
 *)


DecimalPrefix[x_, n_] := Floor[x * 10^(n - 1 - Floor[Log[10, x]])]
DecimalPrefixDigitSum[x_, n_] := Total[IntegerDigits[DecimalPrefix[x, n]]]

NotPerfectSquareQ[x_] := Not[IntegerQ[Sqrt[x]]]
notperfectsquares = Select[Range[1, 100], NotPerfectSquareQ];

Total[Map[Function[x, DecimalPrefixDigitSum[Sqrt[x], 100]], notperfectsquares]]
