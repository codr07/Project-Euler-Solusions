{- 
 - Solution to Project Euler problem 20
 - Copyright (c) Sankha Saha (CODR). All rights reserved.
 - 
 - https://github.com/codr07/Project-Euler-Solusions
 -}

import qualified EulerLib


{- 
 - We do a straightforward product thanks to Haskell's built-in arbitrary precision Integer type.
 -}

main = putStrLn (show ans)
ans = EulerLib.digitSum (EulerLib.factorial 100)
