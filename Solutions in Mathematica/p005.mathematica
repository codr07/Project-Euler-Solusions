(* 
 * Solution to Project Euler problem 5
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 *)


(* 
 * The smallest number n that is evenly divisible by every number in a set {k1, k2, ..., k_m}
 * is also known as the lowest common multiple (LCM) of the set of numbers.
 * The LCM of two natural numbers x and y is given by LCM(x, y) = x * y / GCD(x, y).
 * When LCM is applied to a collection of numbers, it is commutative, associative, and idempotent.
 * Hence LCM(k1, k2, ..., k_m) = LCM(...(LCM(LCM(k1, k2), k3)...), k_m).
 *)
Apply[LCM, Range[20]]
