(* 
 * Solution to Project Euler problem 55
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 *)


ReverseInt[x_] := FromDigits[Reverse[IntegerDigits[x]]]
PalindromeQ[x_] := IntegerDigits[x] == Reverse[IntegerDigits[x]]
LychrelQ[x_] := LychrelQ[x, 49]
LychrelQ[_ , 0 ] := True
LychrelQ[x_, i_] := !PalindromeQ[x + ReverseInt[x]] && LychrelQ[x + ReverseInt[x], i - 1]
Length[Select[Range[9999], LychrelQ]]
