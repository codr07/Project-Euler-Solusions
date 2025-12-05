{- 
 - Solution to Project Euler problem 30
 - Copyright (c) Sankha Saha. All rights reserved.
 - 
 -  
 -   
 -}


main = putStrLn (show ans)
ans = sum [i | i <- [2..10^6 - 1], i == fifthPowerDigitSum i]

fifthPowerDigitSum 0 = 0
fifthPowerDigitSum n = (mod n 10)^5 + (fifthPowerDigitSum (div n 10))
