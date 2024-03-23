# 
# Solution to Project Euler problem 87
# Copyright (c) Sankha Saha (CODR). All rights reserved.
# 
#
# https://github.com/codr07/Project-Euler-Solusions
# 

import eulerlib, math


def compute():
	LIMIT = 50000000
	primes = eulerlib.list_primes(math.isqrt(LIMIT))
	
	sums = {0}
	for i in range(2, 5):
		newsums = set()
		for p in primes:
			q = p**i
			if q > LIMIT:
				break
			for x in sums:
				if x + q <= LIMIT:
					newsums.add(x + q)
		sums = newsums
	return str(len(sums))


if __name__ == "__main__":
	print(compute())
