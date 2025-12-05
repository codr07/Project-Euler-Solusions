(* 
 * Solution to Project Euler problem 2
 * Copyright (c) Sankha Saha. All rights reserved.
 * 
 *  
 *   
 *)


(* Computers are fast, so we can implement this solution directly without any clever math. *)
s = 0;
For[i = 0, (f = Fibonacci[i]) <= 4000000, i++,
  If[EvenQ[f],
    s += f]]
s
