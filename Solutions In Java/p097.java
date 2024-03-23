/* 
 * Solution to Project Euler problem 97
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 */

import java.math.BigInteger;


public final class p097 implements EulerSolution {
	
	public static void main(String[] args) {
		System.out.println(new p097().run());
	}
	
	
	public String run() {
		BigInteger modulus = BigInteger.TEN.pow(10);
		BigInteger n = BigInteger.valueOf(2).modPow(BigInteger.valueOf(7830457), modulus);
		n = n.multiply(BigInteger.valueOf(28433)).mod(modulus);
		n = n.add(BigInteger.ONE).mod(modulus);
		return String.format("%010d", n);
	}
	
}
