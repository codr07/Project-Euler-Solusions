# 
# Solution to Project Euler problem 347
# Copyright (c) Sankha Saha (CODR). All rights reserved.
# 
#
# https://github.com/codr07/Project-Euler-Solusions
# 

import eulerlib, math


def compute():
	LIMIT = 10000000
	
	possible = set()
	primes = eulerlib.list_primes(LIMIT // 2)
	end = math.isqrt(LIMIT)
	for i in range(len(primes)):
		p = primes[i]
		if p > end:
			break
		for j in range(i + 1, len(primes)):
			q = primes[j]
			lcm = p * q
			if lcm > LIMIT:
				break
			multlimit = LIMIT // lcm
			
			multiplier = 1
			while multiplier * p <= multlimit:
				multiplier *= p
			maxmult = multiplier
			while multiplier % p == 0:
				multiplier //= p
				while multiplier * q <= multlimit:
					multiplier *= q
				maxmult = max(multiplier, maxmult)
			possible.add(maxmult * lcm)
	
	ans = sum(possible)
	return str(ans)


if __name__ == "__main__":
	print(compute())
