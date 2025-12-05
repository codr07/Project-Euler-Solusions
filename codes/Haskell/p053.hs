{- 
 - Solution to Project Euler problem 53
 - Copyright (c) Sankha Saha. All rights reserved.
 - 
 -  
 -   
 -}

import qualified EulerLib


main = putStrLn (show ans)
ans = sum [1 | n <- [1..100], r <- [0..n], EulerLib.binomial n r > 10^6]
