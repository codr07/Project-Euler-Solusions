(* 
 * Solution to Project Euler problem 56
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 *)


Max[Flatten[Table[Total[IntegerDigits[a^b]], {a, 100}, {b, 100}]]]
