(* 
 * Solution to Project Euler problem 203
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 *)


SquareFreeQ[n_] := Length[Select[FactorInteger[n], Function[x, x[[2]] > 1]]] == 0
Total[Select[Union[Flatten[Table[Binomial[n, k], {n, 0, 50}, {k, 0, n}]]], SquareFreeQ]]
