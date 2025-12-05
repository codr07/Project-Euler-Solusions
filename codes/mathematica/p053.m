(* 
 * Solution to Project Euler problem 53
 * Copyright (c) Sankha Saha. All rights reserved.
 * 
 *  
 *   
 *)


Length[Select[Flatten[Table[Binomial[n, r], {n, 1, 100}, {r, 0, n}]], Function[x, x > 1000000]]]
