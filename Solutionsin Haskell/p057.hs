{- 
 - Solution to Project Euler problem 57
 - Copyright (c) Sankha Saha (CODR). All rights reserved.
 - 
 - https://github.com/codr07/Project-Euler-Solusions
 -}


limit = 1000
main = putStrLn (show ans)
ans = sum [1 | b <- take limit (contFracSeq 0 1), b]

contFracSeq :: Integer -> Integer -> [Bool]
contFracSeq n d = let
		numer = d
		denom = d * 2 + n
	in (length (show (numer + denom)) > length (show denom)) : (contFracSeq numer denom)
