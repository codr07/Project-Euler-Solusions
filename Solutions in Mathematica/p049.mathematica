(* 
 * Solution to Project Euler problem 49
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 *)


HasSameDigits[x_, y_] := DigitCount[x] == DigitCount[y]
FindTriplet[] := Block[{i, j, base, a, b},
  i = 1;
  While[Prime[i] < 1000, i++];
  For[, (base = Prime[i]) < 10000, i++,
    For[j = i + 1, (a = Prime[j]) < 10000, j++,
      If[(base != 1487 || a != 4817) && HasSameDigits[base, a],
        b = a + (a - base);
        If[b < 10000 && HasSameDigits[a, b] && PrimeQ[b],
          Return[ToString[base] <> ToString[a] <> ToString[b]]]]]]]

FindTriplet[]
