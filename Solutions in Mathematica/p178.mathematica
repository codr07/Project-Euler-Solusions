(* 
 * Solution to Project Euler problem 178
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 *)


Ways[digits_, head_, low_, high_] := Ways[digits, head, low, high] =  (* Memoization *)
  If[digits <= 1, Boole[head == low == high],
    If[head - 1 < low , 0, Ways[digits - 1, head - 1, low, high] + If[head == high, Ways[digits - 1, head - 1, low, high - 1], 0]] +
    If[head + 1 > high, 0, Ways[digits - 1, head + 1, low, high] + If[head == low , Ways[digits - 1, head + 1, low + 1, high], 0]]]

lim = 40;
Sum[Sum[Ways[i, j, 0, 9], {j, 1, 9}], {i, lim}]
