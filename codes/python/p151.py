# 
# Solution to Project Euler problem 151
# Copyright (c) Sankha Saha. All rights reserved.
# 
#  
#   
# 

import functools


def compute():
	ans = get_expected_singles((1,)) - 2
	return f"{ans:.6f}"


@functools.cache
def get_expected_singles(state):
	result = 0.0
	if len(state) > 0:
		for i in range(len(state)):
			tempstate = list(state)
			sheet = state[i]
			del tempstate[i]
			for j in range(sheet + 1, 6):
				tempstate.append(j)
			tempstate.sort()
			result += get_expected_singles(tuple(tempstate))
		result /= len(state)
		if len(state) == 1:
			result += 1.0
	return result


if __name__ == "__main__":
	print(compute())
