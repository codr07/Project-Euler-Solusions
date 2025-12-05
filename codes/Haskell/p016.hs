{- 
 - Solution to Project Euler problem 16
 - Copyright (c) Sankha Saha. All rights reserved.
 - 
 -  
 -   
 -}

import qualified EulerLib


-- We implement this solution in a straightforward way thanks to Haskell's built-in arbitrary precision Integer type.
main = putStrLn (show ans)
ans = EulerLib.digitSum (2^1000 :: Integer)
