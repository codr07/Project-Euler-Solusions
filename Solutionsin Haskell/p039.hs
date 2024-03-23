{- 
 - Solution to Project Euler problem 39
 - Copyright (c) Sankha Saha (CODR). All rights reserved.
 - 
 - https://github.com/codr07/Project-Euler-Solusions
 -}

import Data.List (foldl1')


main = putStrLn (show ans)
ans = argMax numRightTriangles [1..1000]

-- Number of right triangles with perimeter p and integer side lengths.
numRightTriangles :: Int -> Int
numRightTriangles p = sum [1 | a <- [1..p], b <- [a..(div (p-a) 2)], let c = p-a-b in a*a + b*b == c*c]

-- The earliest element x in the list such that (f x) >= (f y) for each element y in the list.
argMax :: Ord b => (a -> b) -> [a] -> a
argMax f = foldl1' (\x y -> if (f y) > (f x) then y else x)
