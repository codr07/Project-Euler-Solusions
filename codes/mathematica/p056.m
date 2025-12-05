(* 
 * Solution to Project Euler problem 56
 * Copyright (c) Sankha Saha. All rights reserved.
 * 
 *  
 *   
 *)


Max[Flatten[Table[Total[IntegerDigits[a^b]], {a, 100}, {b, 100}]]]
