(* 
 * Solution to Project Euler problem 39
 * Copyright (c) Sankha Saha. All rights reserved.
 * 
 *  
 *   
 *)


NumTriangles[p_] := Sum[Boole[Block[{c = p - a - b}, c >= b && a^2 + b^2 == c^2]],
  {a, 1, Floor[p / 3]}, {b, a, Floor[(p - a) / 2]}]
maxnum = 0;
maxperim = 0;
For[p = 1, p <= 1000, p++,
  If[NumTriangles[p] > maxnum,
    maxnum = NumTriangles[p];
    maxperim = p]]
maxperim
