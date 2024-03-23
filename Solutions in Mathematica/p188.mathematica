(* 
 * Solution to Project Euler problem 188
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 *)


$RecursionLimit = 2000;
TetrationMod[x_, 1 , m_] := Mod[x, m]
TetrationMod[x_, y_, m_] := PowerMod[x, TetrationMod[x, y - 1, EulerPhi[m]], m]
TetrationMod[1777, 1855, 10^8]
