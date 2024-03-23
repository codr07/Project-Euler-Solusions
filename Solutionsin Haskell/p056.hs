{- 
 - Solution to Project Euler problem 56
 - Copyright (c) Sankha Saha (CODR). All rights reserved.
 - 
 - https://github.com/codr07/Project-Euler-Solusions
 -}

import qualified EulerLib


main = putStrLn (show ans)
ans = foldl1 max [EulerLib.digitSum (a^b) | a <- [0..99], b <- [0..99]]
