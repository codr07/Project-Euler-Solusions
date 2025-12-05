# 
# Solution to Project Euler problem 55
# Copyright (c) Sankha Saha. All rights reserved.
# 
#  
#   
# 


def compute():
	ans = sum(1 for i in range(10000) if is_lychrel(i))
	return str(ans)


def is_lychrel(n):
	for i in range(50):
		n += int(str(n)[ : : -1])
		if str(n) == str(n)[ : : -1]:
			return False
	return True


if __name__ == "__main__":
	print(compute())
