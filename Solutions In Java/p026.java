/* 
 * Solution to Project Euler problem 26
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 */

import java.util.HashMap;
import java.util.Map;


public final class p026 implements EulerSolution {
	
	public static void main(String[] args) {
		System.out.println(new p026().run());
	}
	
	
	public String run() {
		int bestNumber = 0;
		int bestLength = 0;
		for (int i = 1; i <= 1000; i++) {
			int len = getCycleLength(i);
			if (len > bestLength) {
				bestNumber = i;
				bestLength = len;
			}
		}
		return Integer.toString(bestNumber);
	}
	
	
	private static int getCycleLength(int n) {
		Map<Integer,Integer> stateToIter = new HashMap<>();
		int state = 1;
		for (int iter = 0; ; iter++) {
			if (stateToIter.containsKey(state))
				return iter - stateToIter.get(state);
			else {
				stateToIter.put(state, iter);
				state = state * 10 % n;
			}
		}
	}
	
}
