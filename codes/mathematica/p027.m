(* 
 * Solution to Project Euler problem 27
 * Copyright (c) Sankha Saha. All rights reserved.
 * 
 *  
 *   
 *)


CountConsecutivePrimes[a_, b_] := Block[{i}, For[i = 0, PrimeQ[i^2 + a * i + b], i++]; i]

maxConsecutive = 0;
maxProduct = 0;
For[a = -999, a < 1000, a++,
  For[b = -999, b < 1000, b++,
    temp = CountConsecutivePrimes[a, b];
    If[temp > maxConsecutive,
      maxConsecutive = temp;
      maxProduct = a * b]]]
maxProduct
