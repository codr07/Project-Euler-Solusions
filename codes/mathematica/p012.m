(* 
 * Solution to Project Euler problem 12
 * Copyright (c) Sankha Saha. All rights reserved.
 * 
 *  
 *   
 *)


(* We do a straightforward search with some help from built-in functions. *)
TriangleNumber[n_] = Sum[i, {i, n}];
i = 1;
While[DivisorSigma[0, TriangleNumber[i]] <= 500, i++]
TriangleNumber[i]
