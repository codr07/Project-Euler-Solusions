(*
 * Solution to Project Euler problem 117
 * Copyright (c) Sankha Saha. All rights reserved.
 *
 *  
 *   
 *)


Ways[0] = 1;
Ways[n_] := Ways[n] = Sum[Ways[k], {k, Max[n - 4, 0], n - 1}]  (* Memoization *)
Ways[50]
