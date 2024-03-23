# 
# Solution to Project Euler problem 12
# Copyright (c) Sankha Saha (CODR). All rights reserved.
# 
#
# https://github.com/codr07/Project-Euler-Solusions
# 

import itertools, math


def compute():
	triangle = 0
	for i in itertools.count(1):
		triangle += i  # This is the ith triangle number, i.e. num = 1 + 2 + ... + i = i * (i + 1) / 2
		if num_divisors(triangle) > 500:
			return str(triangle)


# Returns the number of integers in the range [1, n] that divide n.
def num_divisors(n):
	end = math.isqrt(n)
	result = sum(2
		for i in range(1, end + 1)
		if n % i == 0)
	if end**2 == n:
		result -= 1
	return result


if __name__ == "__main__":
	print(compute())
