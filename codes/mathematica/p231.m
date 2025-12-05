(* 
 * Solution to Project Euler problem 231
 * Copyright (c) Sankha Saha. All rights reserved.
 * 
 *  
 *   
 *)


PrimeFactorSum[n_] := Total[Map[Function[a, a[[1]] * a[[2]]], FactorInteger[n]]]

(* 
 * This is mathematically correct but uses too much memory:
 * FactorialPrimeFactorSum[n_] := Total[Map[PrimeFactorSum, Range[n]]]
 * FactorialPrimeFactorSum[n] - FactorialPrimeFactorSum[k] - FactorialPrimeFactorSum[n - k]
 * Note: Binomial[n, k] == Factorial[n] / (Factorial[k] * Factorial[n - k])
 *)

n = 20000000;
k = 15000000;
s = 0;
For[i = k + 1, i <= n, i++,
  s += PrimeFactorSum[i]]
For[i = 1, i <= n - k, i++,
  s -= PrimeFactorSum[i]]
s
