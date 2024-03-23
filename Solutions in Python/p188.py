# 
# Solution to Project Euler problem 188
# Copyright (c) Sankha Saha (CODR). All rights reserved.
# 
#
# https://github.com/codr07/Project-Euler-Solusions
# 

import math, sys


def compute():
	x, y, m = 1777, 1855, 10**8
	sys.setrecursionlimit(y + 30)  # Because the default recursion limit of 1000 is insufficient
	ans = tetration_mod(x, y, m)
	return str(ans)


def tetration_mod(x, y, m):
	if y == 1:
		return x % m
	else:
		# Fact: If x and m are coprime, then x^y mod m = x^(y mod totient(m)) mod m
		return pow(x, tetration_mod(x, y - 1, totient(m)), m)


def totient(n):
	assert n > 0
	p = 1
	i = 2
	end = math.isqrt(n)
	while i <= end:
		if n % i == 0:  # Found a factor
			p *= i - 1
			n //= i
			while n % i == 0:
				p *= i
				n //= i
			end = math.isqrt(n)
		i += 1
	if n != 1:
		p *= n - 1
	return p


if __name__ == "__main__":
	print(compute())
