{- 
 - Solution to Project Euler problem 91
 - Copyright (c) Sankha Saha (CODR). All rights reserved.
 - 
 - https://github.com/codr07/Project-Euler-Solusions
 -}


limit = 50
main = putStrLn (show ans)
ans = sum [1 | x1 <- [0..limit], y1 <- [0..limit], x2 <- [0..limit], y2 <- [0..limit],
	y2 * x1 < y1 * x2 && (isRightTriangle x1 y1 x2 y2)]

isRightTriangle :: Int -> Int -> Int -> Int -> Bool
isRightTriangle x1 y1 x2 y2 = let
	a = x1^2 + y1^2
	b = x2^2 + y2^2
	c = (x1 - x2)^2 + (y1 - y2)^2
	in a + b == c || b + c == a || c + a == b
