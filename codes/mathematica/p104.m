(* 
 * Solution to Project Euler problem 104
 * Copyright (c) Sankha Saha. All rights reserved.
 * 
 *  
 *   
 *)


i = 0;
prevfibmod = 1;  (* Loop invariant: Equal to Fibonacci[i - 1] *)
fibmod = 0;  (* Loop invariant: Equal to Fibonacci[i] *)
While[True,
  If[DigitCount[fibmod] == {1, 1, 1, 1, 1, 1, 1, 1, 1, 0} &&
      Sort[Take[IntegerDigits[Fibonacci[i]], 9]] == Range[9],
    Break[]];
  nextfibmod = Mod[prevfibmod + fibmod, 10^9];
  prevfibmod = fibmod;
  fibmod = nextfibmod;
  i++]
i
