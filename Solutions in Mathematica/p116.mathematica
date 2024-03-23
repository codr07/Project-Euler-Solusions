(*
 * Solution to Project Euler problem 116
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 *
 * https://github.com/codr07/Project-Euler-Solusions
 *)


len = 50;
Ways[_, 0] = 1;
Ways[m_, n_] := Ways[m, n] = Ways[m, n - 1] + If[n >= m, Ways[m, n - m], 0]  (* Memoization *)
Sum[Ways[m, len] - 1, {m, 2, 4}]
