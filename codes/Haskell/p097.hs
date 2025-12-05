{- 
 - Solution to Project Euler problem 97
 - Copyright (c) Sankha Saha. All rights reserved.
 - 
 -  
 -   
 -}


main = putStrLn (show ans)
ans = mod (28433 * 2^7830457 + 1) (10^10) :: Integer
