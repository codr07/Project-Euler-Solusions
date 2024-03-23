{- 
 - Solution to Project Euler problem 132
 - Copyright (c) Sankha Saha (CODR). All rights reserved.
 - 
 - https://github.com/codr07/Project-Euler-Solusions
 -}

import qualified EulerLib


main = putStrLn (show ans)
cond i = EulerLib.isPrime i && (repunitMod (10^9) i) == 0
ans = sum (take 40 (filter cond [2..]))

repunitMod :: Integer -> Integer -> Integer
repunitMod k m = div (powMod 10 k (m * 9) - 1) 9

powMod :: Integer -> Integer -> Integer -> Integer
powMod _ 0 _ = 1
powMod x 1 m = mod x m
powMod x y m = mod ((powMod x (div y 2) m)^2 * (if ((mod y 2) == 0) then 1 else x)) m
