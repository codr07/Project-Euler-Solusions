# 
# Solution to Project Euler problem 9
# Copyright (c) Sankha Saha. All rights reserved.
# 
#  
#   
# 


# Computers are fast, so we can implement a brute-force search to directly solve the problem.
def compute():
	PERIMETER = 1000
	for a in range(1, PERIMETER + 1):
		for b in range(a + 1, PERIMETER + 1):
			c = PERIMETER - a - b
			if a * a + b * b == c * c:
				# It is now implied that b < c, because we have a > 0
				return str(a * b * c)


if __name__ == "__main__":
	print(compute())
