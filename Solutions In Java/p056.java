/* 
 * Solution to Project Euler problem 56
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 */

import java.math.BigInteger;


public final class p056 implements EulerSolution {
	
	public static void main(String[] args) {
		System.out.println(new p056().run());
	}
	
	
	public String run() {
		int max = 0;
		for (int a = 1; a < 100; a++) {
			for (int b = 1; b < 100; b++) {
				BigInteger pow = BigInteger.valueOf(a).pow(b);
				max = Math.max(digitSum(pow), max);
			}
		}
		return Integer.toString(max);
	}
	
	
	private static int digitSum(BigInteger n) {
		int sum = 0;
		String s = n.toString();
		for (int i = 0; i < s.length(); i++)
			sum += s.charAt(i) - '0';
		return sum;
	}
	
}
