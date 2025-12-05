{- 
 - Solution to Project Euler problem 46
 - Copyright (c) Sankha Saha. All rights reserved.
 - 
 -  
 -   
 -}

import qualified EulerLib


main = putStrLn (show ans)
ans = head $ filter (not . satisfiesConjecture) [9, 11 .. ]

satisfiesConjecture :: Integer -> Bool
satisfiesConjecture n = (mod n 2) == 0 || EulerLib.isPrime n ||
	any (\i -> EulerLib.isPrime (n - i * i * 2)) (takeWhile (\i -> i * i * 2 <= n) [1 .. ])
