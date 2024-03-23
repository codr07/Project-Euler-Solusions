/* 
 * Solution to Project Euler problem 15
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 */


public final class p015 implements EulerSolution {
	
	public static void main(String[] args) {
		System.out.println(new p015().run());
	}
	
	
	/* 
	 * This is a classic combinatorics problem. To get from the top left corner to the bottom right corner of an N*N grid,
	 * it involves making exactly N moves right and N moves down in some order. Because each individual down or right move
	 * is indistinguishable, there are exactly 2N choose N (binomial coefficient) ways of arranging these moves.
	 */
	public String run() {
		return Library.binomial(40, 20).toString();
	}
	
}
