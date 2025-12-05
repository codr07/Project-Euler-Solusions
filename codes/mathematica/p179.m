(* 
 * Solution to Project Euler problem 179
 * Copyright (c) Sankha Saha. All rights reserved.
 * 
 *  
 *   
 *)


Length[Select[Range[2, 10^7 - 1], Function[n, DivisorSigma[0, n] == DivisorSigma[0, n + 1]]]]
