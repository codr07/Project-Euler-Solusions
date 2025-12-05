# 
# Solution to Project Euler problem 29
# Copyright (c) Sankha Saha. All rights reserved.
# 
#  
#   
# 


# We generate all the possible powers in the given range, put each value
# into a set, and let the set count the number of unique values present.
def compute():
	seen = set(a**b for a in range(2, 101) for b in range(2, 101))
	return str(len(seen))


if __name__ == "__main__":
	print(compute())
