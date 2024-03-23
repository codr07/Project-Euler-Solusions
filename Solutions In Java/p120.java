/* 
 * Solution to Project Euler problem 120
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 */


public final class p120 implements EulerSolution {
	
	public static void main(String[] args) {
		System.out.println(new p120().run());
	}
	
	
	/* 
	 * For a given a, what is the n that maximizes the remainder, and what is the value of this remainder?
	 * 
	 * Let's simplify one term, mod a^2:
	 *   (a+1)^n = 1^n + (n choose 1) a 1^(n-1) + (n choose 2) a^2 1^(n-2) + ...  (by the binomial theorem)
	 *           = 1 + an + 0.  (remaining addends are 0 because they have a to the power of 2 or more, mod a^2)
	 * Similarly for the other term, mod a^2:
	 *   (a-1)^n = (-1)^n + (n choose 1) a (-1)^(n-1) + ...
	 *           = (-1)^(n-1) (-1 + an + 0)
	 *           = if n is even then (1 - an) else (an - 1).
	 * Therefore, adding the two terms:
	 *   (a+1)^n + (a-1)^n
	 *   = if n is even then 2 else 2an.
	 * 
	 * We can always make 2an >= 2 by taking n=1, for example. So we can disregard the "n is even" case.
	 * Maximizing 2an mod a^2 for n is the same as maximizing 2n mod a for n.
	 *   If a is even,  then the maximum achievable value is a - 2 by setting n = a/2 - 1.
	 *   Else a is odd, then the maximum achievable value is a - 1 by setting n = (a - 1) / 2.
	 * 
	 * In conclusion, if a is even, the maximum remainder is a(a-2);
	 * otherwise a is odd, the maximum remainder is a(a-1).
	 */
	public String run() {
		int sum = 0;
		for (int a = 3; a <= 1000; a++)
			sum += a * (a - (a % 2 == 0 ? 2 : 1));
		return Integer.toString(sum);
	}
	
}
