{- 
 - Solution to Project Euler problem 36
 - Copyright (c) Sankha Saha (CODR). All rights reserved.
 - 
 - https://github.com/codr07/Project-Euler-Solusions
 -}


main = putStrLn (show ans)
ans = sum [i | i <- [1..10^6], isPalindrome (toBase i 10) && isPalindrome (toBase i 2)]

toBase :: (Integral a) => a -> a -> [a]
toBase 0 _ = [0]
toBase n b = reverse (toBase' n) where
	toBase' 0 = []
	toBase' n = (mod n b) : (toBase' (div n b))

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = x == (reverse x)
