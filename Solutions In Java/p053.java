/* 
 * Solution to Project Euler problem 53
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 */

import java.math.BigInteger;


public final class p053 implements EulerSolution {
	
	public static void main(String[] args) {
		System.out.println(new p053().run());
	}
	
	
	public String run() {
		BigInteger MILLION = BigInteger.TEN.pow(6);
		int count = 0;
		for (int n = 1; n <= 100; n++) {
			for (int r = 0; r <= n; r++) {
				if (Library.binomial(n, r).compareTo(MILLION) > 0)
					count++;
			}
		}
		return Integer.toString(count);
	}
	
}
