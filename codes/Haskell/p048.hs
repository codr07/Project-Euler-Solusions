{- 
 - Solution to Project Euler problem 48
 - Copyright (c) Sankha Saha. All rights reserved.
 - 
 -  
 -   
 -}


main = putStrLn (show ans)
ans = mod (sum [k^k | k <- [1..1000]]) (10^10)
