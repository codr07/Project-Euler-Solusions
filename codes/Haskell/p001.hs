{- 
 - Solution to Project Euler problem 1
 - Copyright (c) Sankha Saha. All rights reserved.
 - 
 -  
 -   
 -}


-- Computers are fast, so we can implement this solution directly without any clever math.
main = putStrLn (show ans)
ans = sum [x | x <- [0..999], (mod x 3) == 0 || (mod x 5) == 0]
