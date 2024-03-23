# 
# Solution to Project Euler problem 174
# Copyright (c) Sankha Saha (CODR). All rights reserved.
# 
#
# https://github.com/codr07/Project-Euler-Solusions
# 


def compute():
	SIZE_LIMIT = 1000000
	TYPE_LIMIT = 10
	
	# Generate all possible laminae with at most SIZE_LIMIT tiles
	type = [0] * (SIZE_LIMIT + 1)
	for n in range(3, SIZE_LIMIT // 4 + 2):  # Outer square size
		for m in range(n - 2, 0, -2):  # Inner square hole size
			tiles = n * n - m * m
			if tiles > SIZE_LIMIT:
				break
			type[tiles] += 1
	
	# Examine the type of each total tiling
	ans = sum(1 for t in type if 1 <= t <= TYPE_LIMIT)
	return str(ans)


if __name__ == "__main__":
	print(compute())
