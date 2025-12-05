{- 
 - Solution to Project Euler problem 10
 - Copyright (c) Sankha Saha. All rights reserved.
 - 
 -  
 -   
 -}

import qualified EulerLib


limit = 2000000 :: Int
main = putStrLn (show ans)
ans = sum (filter EulerLib.isPrime [2 .. (limit - 1)])
