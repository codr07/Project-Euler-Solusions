/* 
 * Solution to Project Euler problem 587
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 */


public final class p587 implements EulerSolution {
	
	public static void main(String[] args) {
		System.out.println(new p587().run());
	}
	
	
	/* 
	 * Start by defining the coordinate system in a convenient way. The position and scale of the diagram don't
	 * matter because we only care about the ratio of areas, not the absolute areas. So, let the bottom left
	 * of the diagram be the origin (x = 0, y = 0), and let each circle to have a radius of 1.
	 * 
	 * The leftmost circle is centered at (1, 1), and its equation is (x - 1)^2 + (y - 1)^2 = 1.
	 * The diagonal line has slope = s = 1 / n (for any positive n), and the line's equation is y = s * x.
	 * From basic geometry, the area of the blue L-section is 1 - pi / 4.
	 * 
	 * Let's find the x-coordinate where the diagonal line intersects the first circle.
	 * Take the equation of the circle and substitute y = s * x for the line:
	 * 
	 *   (x - 1)^2 + (s*x - 1)^2 = 1.
	 *   (x^2 - 2x + 1) + (s^2 x^2 - 2s*x + 1) = 1.
	 *   (1 + s^2)x^2 + (-2 - 2s)x + 1 = 0.
	 * 
	 * We can apply the quadratic formula with a = 1 + s^2, b = -2 - 2s, c = 1. There are two solutions for x,
	 * and we only want the smaller value. Thus, let X = (-b - sqrt(b^2 - 4ac)) / (2a). Or equivalently
	 * with more numerical stability (using the Citardauq formula), X = (2c) / (-b + sqrt(b^2 - 4ac)).
	 * 
	 * The orange concave triangle can be divided into two parts by a vertical line:
	 * 
	 * - The left part is a proper triangle, whose area is easily seen as x * y / 2 = X^2 * s / 2.
	 * 
	 * - The right part is the region between the circle and the baseline. Let's re-express
	 *   the circle's equation in terms of y, and only keep the lower semicircle:
	 *   
	 *     (x - 1)^2 + (y - 1)^2 = 1.
	 *     (y - 1)^2 = 1 - (x - 1)^2.
	 *     y - 1 = -sqrt(1 - (x - 1)^2).
	 *     y = 1 - sqrt(1 - (x - 1)^2).
	 *     y = 1 - sqrt(1 - (x^2 - 2x + 1)).
	 *     y = 1 - sqrt(2x - x^2).
	 *   
	 *   Now, the indefinite integral of f(x) = 1 - sqrt(2x - x^2) with respect to x
	 *   is F(x) = (x - 1) - [sqrt(2x - x^2) * (x - 1) + asin(x - 1)] / 2.
	 *   Finding this integral is not obvious, but verifying it is a fairly straightforward
	 *   mechanical procedure involving differentiation and simplification.
	 *   
	 *   The area of the right part is the integral of f(x) for x from X to 1, because the start is
	 *   the x-coordinate where line meets the circle, and the end is where the circle meets the baseline.
	 *   Hence the area is equal to F(1) - F(X).
	 * 
	 * All in all, for any given n, the area of the orange concave triangle is X^2 * s / 2 + F(1) - F(X).
	 * The rest of the algorithm is a brute-force search with n = 1, 2, 3, ... until the ratio condition is met.
	 * 
	 * Additional notes:
	 * - Intuitively, as n increases and the slope gets smaller, the area of the orange concave triangle should strictly
	 *   decrease. This statement is in fact true, but proving it involves a big pile of differentiation and algebra.
	 *   0. We need to show that X (which is the x-coordinate of the line-circle intersection) increases with n.
	 *      We'd differentiate X with respect to n, and get an expression that is always positive for any positive n.
	 *   1. Because X increases with n, the area of the right part, with its always-positive integrand, must decrease.
	 *   2. As for the left part, we'd differentiate X^2 * s / 2 with respect to n, and get a huge messy formula.
	 *      It turns out this formula is negative for all n > 1. Hence the area of this triangle also decreases with n.
	 *   After we prove that increasing n leads to decreasing orange area, we could use
	 *   binary search to find the minimum value of n needed to meet the ratio requirement.
	 * - The use of floating-point arithmetic, for basic arithmetic operations (+ - * /) and irrational functions (sqrt,
	 *   asin) alike, is inherently difficult or impossible to prove the correctness of. Furthermore, the algorithms
	 *   for irrational functions are hard to understand and beyond the scope of this problem, and the error bounds for
	 *   all operations are difficult to reason about.
	 *   It should be possible to solve this particular problem using only integer arithmetic in a provably correct way.
	 *   The basic idea would be to round the result of each operation both down and up to an integer fraction,
	 *   keep track of pessimistic intervals that are guaranteed to contain the true value, accept a comparison only
	 *   if the intervals don't overlap, and recompute everything at a higher precision if a comparison is inconclusive.
	 *   Note: Because it doesn't seem easy to compute pi and asin(), it might be better to
	 *   approximate integrals directly using the Darboux definition of lower and upper sums.
	 */
	public String run() {
		double lSectionArea = 1 - Math.PI / 4;
		for (int i = 1; ; i++) {
			double slope = 1.0 / i;
			double a = slope * slope + 1;
			double b = -2 * (slope + 1);
			double c = 1;
			double x = (2 * c) / (-b + Math.sqrt(b * b - 4 * a * c));
			double concaveTriangleArea = (x * x * slope / 2) + (integral(1) - integral(x));
			if (concaveTriangleArea / lSectionArea < 0.001)
				return Integer.toString(i);
			if (i == Integer.MAX_VALUE)
				throw new AssertionError();
		}
	}
	
	
	// The indefinite integral of (1 - sqrt(2x - x^2)) dx.
	private static double integral(double x) {
		double t = x - 1;
		return t - (Math.sqrt(x * (2 - x)) * t + Math.asin(t)) / 2;
	}
	
}
