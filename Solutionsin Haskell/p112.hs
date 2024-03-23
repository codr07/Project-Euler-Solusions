{- 
 - Solution to Project Euler problem 112
 - Copyright (c) Sankha Saha (CODR). All rights reserved.
 - 
 - https://github.com/codr07/Project-Euler-Solusions
 -}

import Data.List (sort)
import Data.Ratio ((%))
import qualified EulerLib


target = 99 % 100
main = putStrLn (show ans)
ans = let
		func :: Integer -> Integer -> Integer
		func i count = let
			s = show i
			t = sort s
			bouncy = s /= t && (reverse s) /= t
			c = count + (EulerLib.boolToInt bouncy)
			in if ((c % i) == target) then i else (func (i + 1) c)
	in func 1 0
