{- 
 - Solution to Project Euler problem 173
 - Copyright (c) Sankha Saha (CODR). All rights reserved.
 - 
 - https://github.com/codr07/Project-Euler-Solusions
 -}


tiles = 10^6
main = putStrLn (show ans)
ans = sum [length $ takeWhile (\b -> a*a - b*b <= tiles) [(a-2),(a-4)..1] | a <- ([3..(div tiles 4)+1]::[Integer])]
