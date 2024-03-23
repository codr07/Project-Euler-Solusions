(*
 * Solution to Project Euler problem 115
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 *
 * https://github.com/codr07/Project-Euler-Solusions
 *)


m = 50;
Ways[0] = 1;
Ways[n_] := Ways[n] = Ways[n - 1] + If[n >= m, 1 + Sum[Ways[k], {k, 0, n - m - 1}], 0]  (* Memoization *)
i = 0;
While[Ways[i] <= 10^6, i++]
i
