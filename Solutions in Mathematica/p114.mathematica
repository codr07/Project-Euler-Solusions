(*
 * Solution to Project Euler problem 114
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 *
 * https://github.com/codr07/Project-Euler-Solusions
 *)


Ways[n_] := Ways[n] = If[n < 3, 1, Ways[n - 1] + 1 + Sum[Ways[k], {k, 0, n - 4}]]  (* Memoization *)
Ways[50]
