(* 
 * Solution to Project Euler problem 57
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 *)


CountDigits[n_] := Length[IntegerDigits[n]]
ContFrac[n_] := FromContinuedFraction[ContinuedFraction[Sqrt[2], n]]
NumExceedDenomQ[n_] := CountDigits[Numerator[ContFrac[n]]] > CountDigits[Denominator[ContFrac[n]]]
Length[Select[Range[2, 1001], NumExceedDenomQ]]
