/* 
 * Solution to Project Euler problem 30
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 */


public final class p030 implements EulerSolution {
	
	public static void main(String[] args) {
		System.out.println(new p030().run());
	}
	
	
	public String run() {
		// As stated in the problem, 1 = 1^5 is excluded.
		// If a number has at least n >= 7 digits, then even if every digit is 9,
		// n * 9^5 is still less than the number (which is at least 10^n).
		int sum = 0;
		for (int i = 2; i < 1000000; i++) {
			if (i == fifthPowerDigitSum(i))
				sum += i;
		}
		return Integer.toString(sum);
	}
	
	
	private static int fifthPowerDigitSum(int x) {
		int sum = 0;
		while (x != 0) {
			int y = x % 10;
			sum += y * y * y * y * y;
			x /= 10;
		}
		return sum;
	}
	
}
