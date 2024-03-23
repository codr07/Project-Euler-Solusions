{- 
 - Solution to Project Euler problem 52
 - Copyright (c) Sankha Saha (CODR). All rights reserved.
 - 
 - https://github.com/codr07/Project-Euler-Solusions
 -}

import Data.List (sort)


main = putStrLn (show ans)
ans = head (filter cond [1 .. ])
cond x = all (multeq x) [2 .. 6]
multeq x i = (sort (show x)) == (sort (show (i * x)))
