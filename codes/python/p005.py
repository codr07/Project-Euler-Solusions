# 
# Solution to Project Euler problem 5
# Copyright (c) Sankha Saha. All rights reserved.
# 
#  
#   
# 

import math


def compute():
	ans = math.lcm(*range(1, 21))
	return str(ans)


if __name__ == "__main__":
	print(compute())
