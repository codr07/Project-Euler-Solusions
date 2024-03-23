{- 
 - Solution to Project Euler problem 6
 - Copyright (c) Sankha Saha (CODR). All rights reserved.
 - 
 - https://github.com/codr07/Project-Euler-Solusions
 -}


{- 
 - Computers are fast, so we can implement this solution directly without any clever math.
 - However for the mathematically inclined, there are closed-form formulas:
 -   sum  = n(n + 1) / 2.
 -   sum2 = n(n + 1)(2n + 1) / 6.
 - Hence sum^2 - sum2 = (n^4 / 4) + (n^3 / 6) - (n^2 / 4) - (n / 6).
 -}
n = 100
main = putStrLn (show ans)
ans = (sum [1..n])^2 - (sum (map (^2) [1..n]))
