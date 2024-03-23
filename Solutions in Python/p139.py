# 
# Solution to Project Euler problem 139
# Copyright (c) Sankha Saha (CODR). All rights reserved.
# 
#
# https://github.com/codr07/Project-Euler-Solusions
# 

import math


def compute():
	LIMIT = 100000000
	
	# Pythagorean triples theorem:
	#   Every primitive Pythagorean triple with a odd and b even can be expressed as
	#   a = st, b = (s^2-t^2)/2, c = (s^2+t^2)/2, where s > t > 0 are coprime odd integers.
	ans = 0
	for s in range(3, math.isqrt(LIMIT * 2), 2):
		for t in range(1, s, 2):
			a = s * t
			b = (s * s - t * t) // 2
			c = (s * s + t * t) // 2
			p = a + b + c
			if p >= LIMIT:
				break
			if c % (a - b) == 0 and math.gcd(s, t) == 1:
				ans += (LIMIT - 1) // p
	return str(ans)


if __name__ == "__main__":
	print(compute())
