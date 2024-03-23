/* 
 * Solution to Project Euler problem 179
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 */

import java.util.Arrays;


public final class p179 implements EulerSolution {
	
	public static void main(String[] args) {
		System.out.println(new p179().run());
	}
	
	
	private static final int LIMIT = Library.pow(10, 7);
	
	public String run() {
		int[] numDivisors = new int[LIMIT + 1];
		Arrays.fill(numDivisors, 2);  // Invalid for indexes 0 and 1
		for (int i = 2; i < numDivisors.length; i++) {
			for (int j = i * 2; j < numDivisors.length; j += i)
				numDivisors[j]++;
		}
		
		int count = 0;
		for (int i = 2; i < numDivisors.length - 1; i++) {
			if (numDivisors[i] == numDivisors[i + 1])
				count++;
		}
		return Integer.toString(count);
	}
	
}
