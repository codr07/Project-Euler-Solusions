# 
# Solution to Project Euler problem 132
# Copyright (c) Sankha Saha (CODR). All rights reserved.
# 
#
# https://github.com/codr07/Project-Euler-Solusions
# 

import eulerlib, itertools


def compute():
	# Among the integers starting from 2, take the sum of
	# the first 40 integers satisfying the filter condition
	cond = lambda i: eulerlib.is_prime(i) and repunit_mod(10**9, i) == 0
	ans = sum(itertools.islice(filter(cond, itertools.count(2)), 40))
	return str(ans)


def repunit_mod(k, m):
	return (pow(10, k, m * 9) - 1) // 9


if __name__ == "__main__":
	print(compute())
