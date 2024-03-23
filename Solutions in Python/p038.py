# 
# Solution to Project Euler problem 38
# Copyright (c) Sankha Saha (CODR). All rights reserved.
# 
#
# https://github.com/codr07/Project-Euler-Solusions
# 


def compute():
	ans = ""
	for n in range(2, 10):
		for i in range(1, 10**(9 // n)):
			s = "".join(str(i * j) for j in range(1, n + 1))
			if "".join(sorted(s)) == "123456789":
				ans = max(s, ans)
	return ans


if __name__ == "__main__":
	print(compute())
