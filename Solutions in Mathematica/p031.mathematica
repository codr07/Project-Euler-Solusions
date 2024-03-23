(* 
 * Solution to Project Euler problem 31
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 *)


(* 
 * We use the standard recursive algorithm to solve the subset sum problem, with memoization.
 * The order of the coin values does not matter, but the values need to be unique.
 *)
Coins = {1, 2, 5, 10, 20, 50, 100, 200};
Ways[coinIndex_, total_] := Ways[coinIndex, total] =  (* Memoization *)
  If[coinIndex == 0, Boole[total == 0],
    Sum[Ways[coinIndex - 1, total - i * Coins[[coinIndex]]], {i, 0, Floor[total / Coins[[coinIndex]]]}]]
Ways[Length[Coins], 200]
