(* 
 * Solution to Project Euler problem 52
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 *)


SameDigits[x_, y_] := Sort[IntegerDigits[x]] == Sort[IntegerDigits[y]]
i = 1;
While[!(SameDigits[i, 2i] && SameDigits[i, 3i] && SameDigits[i, 4i] && SameDigits[i, 5i] && SameDigits[i, 6i]), i++]
i
