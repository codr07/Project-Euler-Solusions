{- 
 - Solution to Project Euler problem 164
 - Copyright (c) Sankha Saha (CODR). All rights reserved.
 - 
 - https://github.com/codr07/Project-Euler-Solusions
 -}

import qualified EulerLib


base = 10
digits = 20
consecutive = 3
maxSum = 9

{- 
 - Let ways[d][p] be the number of ways that a d-digit number (with possible leading zeros)
 - whose first 'consecutive' (i.e. 3) digits are the same as the digits of p (padding with
 - leading zeros up to 'consecutive' digits) and where each of the ways does not have
 - 'consecutive' consecutive digits whose sum exceeds 'maxSum'.
 - 
 - For example, ways[5][27] is the number of ways that a 5-digit number starts with 027 and has
 - no 3 consecutive digits summing to more than 9. This set of ways includes only {02700, 02701, 02702}
 - and not {02703, 02710, 02799, etc}.
 - 
 - For each d (from 0 to anything) and p (from 0 to (10^consecutive - 1)), ways[d][p] is equal
 - to the sum of ways[d-1][p'] for 10 choices of p'. To explain by example, suppose p = 555.
 - Clearly these 3 digits sum to more than 9, so ways[d][555] = 0. To give another example,
 - suppose p = 421. We strip off the first digit and try all possibilities for the last digit,
 - giving the set {210, 211, ..., 219}. Now we add up the ways with one fewer digit with these
 - prefixes: ways[d][421] = ways[d-1][210] + ways[d-1][211] + ... + ways[d-1][219].
 - 
 - The final number of ways wanted is for strict 20-digit numbers (i.e. with no leading zeros),
 - which is equal to the number of ways for non-strict 23-digit numbers that start with 000 minus
 - the number of non-strict 22-digit numbers that start with 000, leaving only 22-digit numbers
 - that start with 001 to 009, which are exactly the 20-digit numbers that start with 1 to 9.
 -}

main = putStrLn (show ans)
ans = (ways (digits + consecutive) 0) - (ways (digits + consecutive - 1) 0)

ways :: Int -> Int -> Integer
ways 0 0 = 1
ways 0 _ = 0
ways d p = if (EulerLib.digitSum p) > maxSum then 0
	else sum [waysMemo !! (d - 1) !! ((mod p (base^(consecutive - 1))) * base + i) | i <- [0..9]]
waysMemo = [[ways d p | p <- [0..]] | d <- [0..]]
