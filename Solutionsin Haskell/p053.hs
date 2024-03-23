{- 
 - Solution to Project Euler problem 53
 - Copyright (c) Sankha Saha (CODR). All rights reserved.
 - 
 - https://github.com/codr07/Project-Euler-Solusions
 -}

import qualified EulerLib


main = putStrLn (show ans)
ans = sum [1 | n <- [1..100], r <- [0..n], EulerLib.binomial n r > 10^6]
