# 
# Solution to Project Euler problem 125
# Copyright (c) Sankha Saha (CODR). All rights reserved.
# 
#
# https://github.com/codr07/Project-Euler-Solusions
# 

import itertools


def compute():
	nums = set()
	for i in range(1, 10001):
		sigma = i * i
		for j in itertools.count(i + 1):
			sigma += j * j
			if sigma >= 100000000:
				break
			s = str(sigma)
			if s == s[ : : -1]:  # Is palindrome
				nums.add(sigma)
	return str(sum(nums))


if __name__ == "__main__":
	print(compute())
