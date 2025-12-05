(* 
 * Solution to Project Euler problem 36
 * Copyright (c) Sankha Saha. All rights reserved.
 * 
 *  
 *   
 *)


PalindromeQ[n_, b_] := IntegerDigits[n, b] == Reverse[IntegerDigits[n, b]]
Total[Select[Range[999999], Function[x, PalindromeQ[x, 2] && PalindromeQ[x, 10]]]]
