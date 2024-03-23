# 
# Solution to Project Euler problem 16
# Copyright (c) Sankha Saha (CODR). All rights reserved.
# 
#
# https://github.com/codr07/Project-Euler-Solusions
# 


# We implement this solution in a straightforward way thanks to Python's built-in arbitrary precision integer type.
def compute():
	n = 2**1000
	ans = sum(int(c) for c in str(n))
	return str(ans)


if __name__ == "__main__":
	print(compute())
