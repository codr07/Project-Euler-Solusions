{- 
 - Solution to Project Euler problem 65
 - Copyright (c) Sankha Saha (CODR). All rights reserved.
 - 
 - https://github.com/codr07/Project-Euler-Solusions
 -}

import qualified EulerLib


limit = 100
main = putStrLn (show ans)
ans = let
		func i end
			| i >= end = (1, 0)
			| otherwise = let (n, d) = func (i+1) end
			in ((eContFracTerm i) * n + d, n)
		(numer, _) = func 0 limit
	in EulerLib.digitSum numer

eContFracTerm 0 = 2
eContFracTerm i
	| mod i 3 == 2 = (div i 3) * 2 + 2
	| otherwise    = 1
