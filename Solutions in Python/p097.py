# 
# Solution to Project Euler problem 97
# Copyright (c) Sankha Saha (CODR). All rights reserved.
# 
#
# https://github.com/codr07/Project-Euler-Solusions
# 


def compute():
	MOD = 10**10
	ans = (28433 * pow(2, 7830457, MOD) + 1) % MOD
	return str(ans)


if __name__ == "__main__":
	print(compute())
