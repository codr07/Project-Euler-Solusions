(* 
 * Solution to Project Euler problem 4
 * Copyright (c) Sankha Saha. All rights reserved.
 * 
 *  
 *   
 *)


(* Computers are fast, so we can implement this solution directly without any clever math. *)
PalindromeQ[x_] := IntegerDigits[x] == Reverse[IntegerDigits[x]]
Max[Select[Flatten[Table[i * j, {i, 100, 999}, {j, 100, 999}]], PalindromeQ]]
