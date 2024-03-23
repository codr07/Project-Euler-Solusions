(* 
 * Solution to Project Euler problem 36
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 *)


PalindromeQ[n_, b_] := IntegerDigits[n, b] == Reverse[IntegerDigits[n, b]]
Total[Select[Range[999999], Function[x, PalindromeQ[x, 2] && PalindromeQ[x, 10]]]]
