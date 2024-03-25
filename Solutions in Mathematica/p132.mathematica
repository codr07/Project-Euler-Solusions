(* 
 * Solution to Project Euler problem 132
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 *)


(* 
 * Note:
 * Repunit[n_] := Sum[10^k, {k, 0, n - 1}]
 * Mod[Repunit[n], m] == (PowerMod[10, n, m * 9] - 1) / 9
 *)
s = 0;
c = 0;
For[i = 1, c < 40, i++,
  If[(PowerMod[10, 10^9, Prime[i] * 9] - 1) / 9 == 0,
    s += Prime[i];
    c++]]
s