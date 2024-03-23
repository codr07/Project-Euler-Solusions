{- 
 - Solution to Project Euler problem 10
 - Copyright (c) Sankha Saha (CODR). All rights reserved.
 - 
 - https://github.com/codr07/Project-Euler-Solusions
 -}

import qualified EulerLib


limit = 2000000 :: Int
main = putStrLn (show ans)
ans = sum (filter EulerLib.isPrime [2 .. (limit - 1)])
