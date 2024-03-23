(* 
 * Solution to Project Euler problem 40
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 *)


str = Apply[Join, Table[IntegerDigits[n], {n, 10^6}]];
Product[str[[10^i]], {i, 0, 6}]
