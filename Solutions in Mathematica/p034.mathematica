(* 
 * Solution to Project Euler problem 34
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 *)


(* Each candidate number is less than 10^7 because even the largest 8-digit number, 9999999, yields a sum of only 8 * 9! = 2903040, which is 7 digits. *)
Total[Select[Range[3, 10^7], Function[n, n == Total[Map[Factorial, IntegerDigits[n]]]]]]
