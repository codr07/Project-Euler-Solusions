# 
# Solution to Project Euler problem 53
# Copyright (c) Sankha Saha (CODR). All rights reserved.
# 
#
# https://github.com/codr07/Project-Euler-Solusions
# 

import math


def compute():
	ans = sum(1
		for n in range(1, 101)
		for k in range(0, n + 1)
		if math.comb(n, k) > 1000000)
	return str(ans)


if __name__ == "__main__":
	print(compute())
