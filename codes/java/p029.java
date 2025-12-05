/* 
 * Solution to Project Euler problem 29
 * Copyright (c) Sankha Saha. All rights reserved.
 * 
 *  
 *   
 */

import java.math.BigInteger;
import java.util.HashSet;
import java.util.Set;


public final class p029 implements EulerSolution {
	
	public static void main(String[] args) {
		System.out.println(new p029().run());
	}
	
	
	/* 
	 * We generate all the possible powers in the given range, put each value
	 * into a set, and let the set count the number of unique values present.
	 */
	public String run() {
		Set<BigInteger> generated = new HashSet<>();
		for (int a = 2; a <= 100; a++) {
			for (int b = 2; b <= 100; b++)
				generated.add(BigInteger.valueOf(a).pow(b));
		}
		return Integer.toString(generated.size());
	}
	
}
