{- 
 - Solution to Project Euler problem 9
 - Copyright (c) Sankha Saha. All rights reserved.
 - 
 -  
 -   
 -}


-- Computers are fast, so we can implement a brute-force search to directly solve the problem.
perim = 1000
main = putStrLn (show ans)
ans = head [a * b * (perim - a - b) | a <- [1..perim], b <- [a+1..perim], isIntegerRightTriangle a b]
isIntegerRightTriangle a b = a < b && b < c
	&& a * a + b * b == c * c
	where c = perim - a - b
