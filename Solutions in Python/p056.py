# 
# Solution to Project Euler problem 56
# Copyright (c) Sankha Saha (CODR). All rights reserved.
# 
#
# https://github.com/codr07/Project-Euler-Solusions
# 


def compute():
	ans = max(sum(int(c) for c in str(a**b))
		for a in range(100) for b in range(100))
	return str(ans)


if __name__ == "__main__":
	print(compute())
