{- 
 - Solution to Project Euler problem 160
 - Copyright (c) Sankha Saha (CODR). All rights reserved.
 - 
 - https://github.com/codr07/Project-Euler-Solusions
 -}


main = putStrLn (show ans)
ans = f (10^12 :: Integer)

-- factorialSuffix
f n = md $ (g n) * (powMod 2 ((c 2 n) - (c 5 n)))

-- factorialish
g n = md $ (ge n) * (go n)

-- evenFactorialish
ge 0 = 1
ge n = g (div n 2)

-- oddFactorialish
go 0 = 1
go n = md $ (go (div n 5)) * (h n)

-- factorialCoprime
h n = foldl (\x y -> md $ x * y) 1 [k | k <- [1..md n], (mod k 2) /= 0 && (mod k 5) /= 0]

-- countFactors
c n 0 = 0
c n m = (div m n) + (c n (div m n))

-- Modular arithmetic
powMod _ 0 = md 1
powMod x y
	| mod y 2 == 0 = temp
	| otherwise    = md (temp * x)
	where
		temp = powMod (md (x * x)) (div y 2)

md n = mod n (10^5)  -- Modulo reduction for this problem
