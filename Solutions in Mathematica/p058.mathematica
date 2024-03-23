(* 
 * Solution to Project Euler problem 58
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 *)


(* 
 * From the diagram, let's observe the four corners of an n * n square (where n is odd).
 * It's not hard to convince yourself that:
 * - The bottom right corner always has the value n^2.
 * Working clockwise (backwards):
 * - The bottom left corner has the value n^2 - (n - 1).
 * - The top left corner has the value n^2 - 2(n - 1).
 * - The top right has the value n^2 - 3(n - 1).
 * 
 * Furthermore, the number of elements on the diagonal is 2n - 1.
 *)
p = 0;
For[n = 1, True, n += 2,
  p += Sum[Boole[PrimeQ[n^2 - k * (n - 1)]], {k, 0, 3}];
  If[n > 1 && p / (n * 2 - 1) < 1/10,
    Break[]]]
n
