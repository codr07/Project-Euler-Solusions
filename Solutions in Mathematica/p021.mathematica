(* 
 * Solution to Project Euler problem 21
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 *)


(* 
 * We modify a built-in function to find the sum of proper divisors of a number.
 * Then we apply the definition of an amicable number straightforwardly.
 *)
DivisorSum[n_] := DivisorSigma[1, n] - n
AmicableQ[n_] := DivisorSum[n] != n && DivisorSum[DivisorSum[n]] == n
Total[Select[Range[9999], AmicableQ]]
