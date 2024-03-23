# 
# Solution to Project Euler problem 65
# Copyright (c) Sankha Saha (CODR). All rights reserved.
# 
#
# https://github.com/codr07/Project-Euler-Solusions
# 


def compute():
	numer = 1
	denom = 0
	for i in reversed(range(100)):
		numer, denom = e_contfrac_term(i) * numer + denom, numer
	ans = sum(int(c) for c in str(numer))
	return str(ans)


def e_contfrac_term(i):
	if i == 0:
		return 2
	elif i % 3 == 2:
		return i // 3 * 2 + 2
	else:
		return 1


if __name__ == "__main__":
	print(compute())
