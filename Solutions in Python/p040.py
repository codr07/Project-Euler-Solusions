# 
# Solution to Project Euler problem 40
# Copyright (c) Sankha Saha (CODR). All rights reserved.
# 
#
# https://github.com/codr07/Project-Euler-Solusions
# 


def compute():
	s = "".join(str(i) for i in range(1, 1000000))
	ans = 1
	for i in range(7):
		ans *= int(s[10**i - 1])
	return str(ans)


if __name__ == "__main__":
	print(compute())
