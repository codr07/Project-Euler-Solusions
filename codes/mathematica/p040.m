(* 
 * Solution to Project Euler problem 40
 * Copyright (c) Sankha Saha. All rights reserved.
 * 
 *  
 *   
 *)


str = Apply[Join, Table[IntegerDigits[n], {n, 10^6}]];
Product[str[[10^i]], {i, 0, 6}]
