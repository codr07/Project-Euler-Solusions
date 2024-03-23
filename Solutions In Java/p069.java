/* 
 * Solution to Project Euler problem 69
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 */


public final class p069 implements EulerSolution {
	
	public static void main(String[] args) {
		System.out.println(new p069().run());
	}
	
	
	private static final int LIMIT = Library.pow(10, 6);
	
	public String run() {
		int maxNumer = 0;
		int maxDenom = 1;
		int[] totients = Library.listTotients(LIMIT);
		for (int n = 1; n < totients.length; n++) {
			if ((long)n * maxDenom > (long)maxNumer * totients[n]) {
				maxNumer = n;
				maxDenom = totients[n];
			}
		}
		return Integer.toString(maxNumer);
	}
	
}
