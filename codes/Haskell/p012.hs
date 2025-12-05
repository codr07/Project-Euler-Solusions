{- 
 - Solution to Project Euler problem 12
 - Copyright (c) Sankha Saha. All rights reserved.
 - 
 -  
 -   
 -}

import qualified EulerLib


main = putStrLn (show ans)
ans = head $ filter (\n -> (divisors n) > 500) $ map triangleNumber [0..]

triangleNumber i = div (i * (i + 1)) 2

divisors :: Int -> Int
divisors n = (sum [1 | k <- [1 .. (EulerLib.sqrt n)], mod n k == 0]) * 2 - EulerLib.boolToInt ((EulerLib.sqrt n)^2 == n)
