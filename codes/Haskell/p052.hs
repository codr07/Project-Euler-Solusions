{- 
 - Solution to Project Euler problem 52
 - Copyright (c) Sankha Saha. All rights reserved.
 - 
 -  
 -   
 -}

import Data.List (sort)


main = putStrLn (show ans)
ans = head (filter cond [1 .. ])
cond x = all (multeq x) [2 .. 6]
multeq x i = (sort (show x)) == (sort (show (i * x)))
