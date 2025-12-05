(* 
 * Solution to Project Euler problem 64
 * Copyright (c) Sankha Saha. All rights reserved.
 * 
 *  
 *   
 *)


Length[Select[Range[10000], Function[x, !IntegerQ[Sqrt[x]] && OddQ[Length[Last[ContinuedFraction[Sqrt[x]]]]]]]]
