{- 
 - Solution to Project Euler problem 56
 - Copyright (c) Sankha Saha. All rights reserved.
 - 
 -  
 -   
 -}

import qualified EulerLib


main = putStrLn (show ans)
ans = foldl1 max [EulerLib.digitSum (a^b) | a <- [0..99], b <- [0..99]]
