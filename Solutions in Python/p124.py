# 
# Solution to Project Euler problem 124
# Copyright (c) Sankha Saha (CODR). All rights reserved.
# 
#
# https://github.com/codr07/Project-Euler-Solusions
# 


def compute():
	LIMIT = 100000
	
	# Modification of the sieve of Eratosthenes
	rads = [0] + [1] * LIMIT
	for i in range(2, len(rads)):
		if rads[i] == 1:
			for j in range(i, len(rads), i):
				rads[j] *= i
	
	data = sorted((rad, i) for (i, rad) in enumerate(rads))
	return str(data[10000][1])


if __name__ == "__main__":
	print(compute())
