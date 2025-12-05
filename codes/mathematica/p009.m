(* 
 * Solution to Project Euler problem 9
 * Copyright (c) Sankha Saha. All rights reserved.
 * 
 *  
 *   
 *)


(* Computers are fast, so we can implement a brute-force search to directly solve the problem. *)
For[a = 1, a <= 1000, a++,
  For[b = a + 1, b <= 1000, b++,
    Block[{c = 1000 - a - b},
      If[a < b < c && a^2 + b^2 == c^2,
        Print[a, " ", b, " ", c, " ", a * b * c]]]]]
