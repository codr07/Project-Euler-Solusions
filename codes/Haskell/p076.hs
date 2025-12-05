{- 
 - Solution to Project Euler problem 76
 - Copyright (c) Sankha Saha. All rights reserved.
 - 
 -  
 -   
 -}


main = putStrLn (show ans)
ans = ((partitions 100 1) - 1) :: Integer

partitions n k
	| k > n = 0
	| k == n = 1
	| otherwise = (partitionsMemo !! n !! (k+1)) + (if k > 0 then (partitionsMemo !! (n-k) !! k) else 0)
partitionsMemo = [[partitions n k | k <- [0..]] | n <- [0..]]
