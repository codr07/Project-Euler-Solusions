(* 
 * Solution to Project Euler problem 19
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 *)


(* 
 * We simply use Mathematica's built-in date library to compute the answer by brute force.
 *)
<< Miscellaneous`Calendar`
Sum[Boole[DayOfWeek[{y, m, 1}] === Sunday], {y, 1901, 2000}, {m, 1, 12}]
