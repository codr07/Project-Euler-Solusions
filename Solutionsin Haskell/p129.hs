{- 
 - Solution to Project Euler problem 129
 - Copyright (c) Sankha Saha (CODR). All rights reserved.
 - 
 - https://github.com/codr07/Project-Euler-Solusions
 -}


{- 
 - Let n >= 1 be arbitrary but assume that it is coprime with 10.
 - We want to find the smallest k such that R(k) = 0 mod n, and we'll show that 1 <= k <= n.
 - 
 - Let "the sequence" of n values be (R(1) mod n, R(2) mod n, R(3) mod n, ..., R(n) mod n).
 - For the sake of contradiction, assume that none of the values in the sequence are 0.
 - 
 - Each number in the sequence is an integer in the range [1, n).
 - The range has n - 1 elements, but there are n elements in the sequence.
 - Hence by the pigeonhole principle, there exist two distinct indexes
 - in the sequence where the elements have the same value.
 - 
 - Suppose the two distinct indexes (1-based) are i and j.
 - So the two values in question are R(i) mod n and R(j) mod n.
 - Suppose WLOG that j > i. Then clearly R(j) - R(i) = 0 mod n,
 - and so R(j) - R(i) = 1...10...0 = R(j - i) * 10^i = 0 mod n.
 - 
 - Since 10 is coprime with n, 10 (and its powers) are invertible modulo n.
 - Multiply everything in the equation by 10^-i, and we get R(j - i) = 1...1 = 0 mod n.
 - 
 - We know 1 <= j - i <= n - 1. Then R(i - j) mod n, which is 0, is in the sequence.
 - This contradicts our assumption that none of (R(1), R(2), ... R(n)) is 0 mod n.
 - 
 - Therefore if we want to find an n whose solution k is such that
 - k > 1000000, then we need to have n > 1000000.
 -}

limit = (10^6) :: Int
main = putStrLn (show ans)
cond n = (leastDivisibleRepunit n) > limit
ans = head (filter cond [limit..])


-- Computes the smallest k such that R(k) is divisible by n.
leastDivisibleRepunit :: Int -> Int
leastDivisibleRepunit n
	| (mod n 2) == 0 || (mod n 5) == 0 = 0
	| otherwise = let
		func 0 _ k = k
		func s p k = func (mod (s + p * 10) n) (mod (p * 10) n) (k + 1)
	in func 1 1 1
