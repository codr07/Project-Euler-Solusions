/* 
 * Solution to Project Euler problem 76
 * Copyright (c) Sankha Saha. All rights reserved.
 * 
 *  
 *   
 */

import java.math.BigInteger;


public final class p076 implements EulerSolution {
	
	public static void main(String[] args) {
		System.out.println(new p076().run());
	}
	
	
	public String run() {
		return partitions(100, 1).subtract(BigInteger.ONE).toString();
	}
	
	
	private static BigInteger partitions(int n, int k) {
		// Dynamic programming
		BigInteger[][] table = new BigInteger[n + 1][n + 1];
		for (int i = 0; i <= n; i++) {
			for (int j = n; j >= 0; j--) {
				if (j == i)
					table[i][j] = BigInteger.ONE;
				else if (j > i)
					table[i][j] = BigInteger.ZERO;
				else if (j == 0)
					table[i][j] = table[i][j + 1];
				else
					table[i][j] = table[i][j + 1].add(table[i - j][j]);
			}
		}
		return table[n][k];
	}
	
}
