{- 
 - Solution to Project Euler problem 21
 - Copyright (c) Sankha Saha. All rights reserved.
 - 
 -  
 -   
 -}


{- 
 - We find the sum of proper divisors of a number by brute force,
 - and apply the definition of an amicable number straightforwardly.
 -}

main = putStrLn (show ans)
ans = sum [n | n <- [1..10^4], amicable n]

amicable :: Int -> Bool
amicable n = let m = divisorSum n in (m /= n) && (divisorSum m) == n

divisorSum :: Int -> Int
divisorSum n = sum [k | k <- [1..n-1], (mod n k) == 0]
