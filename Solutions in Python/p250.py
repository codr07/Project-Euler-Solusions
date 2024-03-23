# 
# Solution to Project Euler problem 250
# Copyright (c) Sankha Saha (CODR). All rights reserved.
# 
#
# https://github.com/codr07/Project-Euler-Solusions
# 


def compute():
	# Use dynamic programming
	MOD = 10**16
	subsets = [0] * 250  # subsets[i] is {the number of subsets with sum equal to i mod 250} mod 10^16
	subsets[0] = 1
	
	for i in range(1, 250250 + 1):
		offset = pow(i, i, 250)
		subsets = [(val + subsets[(j - offset) % 250]) % MOD
			for (j, val) in enumerate(subsets)]
	
	ans = (subsets[0] - 1) % MOD
	return str(ans)


if __name__ == "__main__":
	print(compute())
