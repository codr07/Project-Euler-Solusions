/* 
 * Solution to Project Euler problem 216
 * Copyright (c) Sankha Saha (CODR). All rights reserved.
 * 
 * https://github.com/codr07/Project-Euler-Solusions
 */


public final class p216 implements EulerSolution {
	
	public static void main(String[] args) {
		System.out.println(new p216().run());
	}
	
	
	/*
	 * As per the problem statement, define t(n) = 2n^2 - 1 and assume that always n > 1.
	 * Hence t(n) >= 7, and the sequence is strictly increasing (with no repeats).
	 * 
	 * Algorithm statement:
	 * 0. Create a mutable sequence of integers, with indices (2, 3, 4, ..., 50000000)
	 *    initialized to (t(2), t(3), t(4), ..., t(50000000)).
	 * 1. For each index i = (2, 3, ..., 50000000) in ascending order:
	 *    a) If seq(i) = t(i) (the original value), then t(i) must be prime (proven below). Continue to (b).
	 *    b) If seq(i) > 1, then let p = seq(i) (actually prime but not obvious), and for each choice of index j
	 *       with 1 < j = kp +/- i <= 50000000, divide at least one factor of p from seq(j) until they are coprime.
	 *    c) Else seq(i) = 1, then do nothing.
	 * 
	 * Lemma: No term t(n) is divisible by 2, 3, or 5.
	 * Proof:
	 * - For all n, t(n) = 2n^2 - 1 is clearly odd.
	 * - Suppose n = {0, 1, 2} mod 3. Then 2n^2 - 1 = {2, 1, 1} mod 3, all of which are nonzero.
	 * - Suppose n = {0, 1, 2, 3, 4} mod 5. Then 2n^2 - 1 = {4, 1, 2, 2, 1} mod 5, all of which are nonzero.
	 * 
	 * Lemma:
	 *   If some p (can be prime or composite) divides some term t(n), then p also divides t(kp +/- n) for all k
	 *   that produces an in-bounds index; furthermore these are the only indices where the term is divisible by p.
	 * Proof:
	 *   We have the fact that p divides t(n), which means 2n^2 - 1 = 0 mod p.
	 *   To find all indices j where p divides t(j), we derive:
	 *        t(j) = 0 mod p
	 *   <=>  2j^2 - 1 = 0 mod p
	 *   <=>  2j^2 - 1 = 2n^2 - 1 mod p
	 *   <=>  2j^2 = 2n^2 mod p
	 *   <=>  2(j^2 - n^2) = 0 mod p
	 *   <=>  2(j - n)(j + n) = 0 mod p
	 *   <=>  (j = n mod p) inclusive-or (j = -n mod p).
	 *   In fact, the two cases are disjoint because n != 0 mod p, since it would imply
	 *   t(n) = 2n^2 - 1 = 0 - 1 mod p, which contradicts the initial assumption that p divides t(n).
	 *   The case j = n mod p is satisfied by j = kp + n for any k. The case j = -n mod p is satisfied by j = kp - n for any k.
	 *   Thus if j is of the form kp +/- n and j > 1, these are necessary and sufficient conditions for p to divide t(j).
	 * 
	 * Lemma: In the algorithm's main loop, for each index i when it is visited, the value seq(i) is either 1 or a prime number.
	 * Proof:
	 *   For i = (2, 3, 4) this is clearly true since t(i) is prime. Otherwise:
	 *   Suppose some prime p divides seq(i). What can its value be?
	 *   - Case p < i: By the second lemma, p also divides t(i - p). We know that i - p >= 1. We argue that i - p = 1
	 *     is impossible, because then i = p + 1, and t(i) = 2i^2 - 1 = 2(p + 1)^2 - 1 = 2p^2 + 4p + 1 = 1 mod p,
	 *     which is not a multiple of p. Hence i - p >= 2. This means p would have been the value of seq(j) for some j < i,
	 *     and factors of p would have been divided out of seq(i) already.
	 *   - Case p = i: This is impossible because t(i) = 2i^2 - 1 = -1 mod p. Furthermore,
	 *     this is still impossible even if factors are divided out of t(i) to yield seq(i).
	 *   - Case i < p < 2i: By the second lemma, p also divides t(p - i). We know that p - i >= 1. We argue that p - i = 1
	 *     is impossible, because then i = p - 1, and t(i) = 2i^2 - 1 = 2(p - 1)^2 - 1 = 2p^2 - 4p + 1 = 1 mod p,
	 *     which is not a multiple of p. Hence p - i >= 2. This means p would have been the value of seq(j) for some j < i,
	 *     and factors of p would have been divided out of seq(i) already.
	 *   - Case 2i < p: If seq(i) itself is prime, then there is no problem. Otherwise it would have at least two prime factors
	 *     p, q > 2i, but it would mean pq > 4i^2 > 2i^2 (because i > 0) > 2i^2 - 1 = t(i) >= seq(i), which is a contradiction.
	 *   Therefore the only non-contradictory case is the one where seq(i) is a prime number.
	 * 
	 * Credits:
	 *   My algorithm and proof were written with major help from this document:
	 *   https://code.google.com/archive/p/fun-math-problems/source/default/source?page=15 , p216.tex
	 */
	
	private static final int LIMIT = 50000000;
	
	public String run() {
		// Produce the entire sequence
		long[] sequence = new long[LIMIT + 1];
		sequence[0] = sequence[1] = -1;
		for (int i = 2; i < sequence.length; i++)
			sequence[i] = 2L * i * i - 1;
		
		// Divide out factors using a kind of sieve
		int count = 0;
		for (int i = 2; i < sequence.length; i++) {
			// We can assert at this point that term == 1 || isPrime(term)
			long term = sequence[i];
			if (term == 2L * i * i - 1)
				count++;
			
			// We can skip if term > LIMIT * 2 because in the second loop would do nothing. This also avoids overflows because term is a long.
			// The loop does nothing because: i <= LIMIT < p/2; p/2 - i > 0; p - i > p/2; 2(p - i) > p. Clearly 2(p - i) < 2p.
			// Hence 2(p - i) % p = p - 2i. Next, the start index j = i + (p - 2i) = p - i > p/2 >= LIMIT, therefore j > LIMIT.
			if (1 < term && term <= LIMIT * 2) {
				// Visit specific later entries in the sequence and divide out all factors of p
				int p = (int)term;
				// j starts at the smallest number such that j > i and j = +i mod p
				for (int j = i + p; j < sequence.length; j += p) {
					assert sequence[j] % p == 0;
					do sequence[j] /= p;
					while (sequence[j] % p == 0);
				}
				// j starts at the smallest number such that j > i and j = -i mod p
				for (int j = i + (p - i) * 2 % p; j < sequence.length; j += p) {
					assert sequence[j] % p == 0;
					do sequence[j] /= p;
					while (sequence[j] % p == 0);
				}
			}
		}
		return Integer.toString(count);
	}
	
}
