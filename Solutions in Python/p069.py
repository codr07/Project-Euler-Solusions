# 
# Solution to Project Euler problem 69
# Copyright (c) Sankha Saha (CODR). All rights reserved.
# 
#
# https://github.com/codr07/Project-Euler-Solusions
# 

import eulerlib, fractions


def compute():
	totients = eulerlib.list_totients(10**6)
	ans = max(range(2, len(totients)), key=(lambda i: fractions.Fraction(i, totients[i])))
	return str(ans)


if __name__ == "__main__":
	print(compute())
