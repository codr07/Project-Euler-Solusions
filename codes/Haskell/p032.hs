{- 
 - Solution to Project Euler problem 32
 - Copyright (c) Sankha Saha. All rights reserved.
 - 
 -  
 -   
 -}

import Data.List (sort)
import qualified EulerLib


main = putStrLn (show ans)
ans = sum [n | n <- [1..9999], hasPandigitalProduct n]

hasPandigitalProduct :: Int -> Bool
hasPandigitalProduct n = or [pandigital ((digits n) ++ (digits i) ++ (digits (div n i)))
	| i <- [1..(EulerLib.sqrt n)+1], mod n i == 0]

digits :: Int -> [Int]
digits 0 = [0]
digits n = digits' n where
	digits' 0 = []
	digits' n = (digits' (div n 10)) ++ [mod n 10]

pandigital :: [Int] -> Bool
pandigital d = (sort d) == [1..9]
