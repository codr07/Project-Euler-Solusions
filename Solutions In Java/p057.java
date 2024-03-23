/* 
 * Solution to Project Euler problem 57
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 */

import java.math.BigInteger;


public final class p057 implements EulerSolution {
	
	public static void main(String[] args) {
		System.out.println(new p057().run());
	}
	
	
	private static final int LIMIT = 1000;
	
	public String run() {
		BigInteger n = BigInteger.ZERO;
		BigInteger d = BigInteger.ONE;
		int count = 0;
		for (int i = 0; i < LIMIT; i++) {
			BigInteger temp = d.multiply(BigInteger.valueOf(2)).add(n);
			n = d;
			d = temp;
			// Now n/d is the i'th (0-based) continued fraction approximation of sqrt(2) - 1
			if (n.add(d).toString().length() > d.toString().length())
				count++;
		}
		return Integer.toString(count);
	}
	
}
