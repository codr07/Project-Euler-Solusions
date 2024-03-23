(* 
 * Solution to Project Euler problem 1
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 *)


(* Computers are fast, so we can implement this solution directly without any clever math. *)
Total[Select[Range[999], Function[x, Mod[x, 3] == 0 || Mod[x, 5] == 0]]]
