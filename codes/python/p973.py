# 
# Shared code for solutions to Project Euler problems
# Copyright (c) Sankha Saha. All rights reserved.
import sys
from fractions import Fraction
import sys

# Increase recursion depth for partition generation
sys.setrecursionlimit(5000)

MOD = 10**9 + 7

def solve():
    print("Generating sequence X(n) for even n...")
    seq = []
    # We need enough terms to find the recurrence. 
    # n=2, 4, 6, 8, 10, 12, 14 should be sufficient for Berlekamp-Massey.
    for n in range(2, 16, 2):
        val = compute_expected_score(n)
        seq.append(val)
        print(f"X({n}) = {val}")

    print("\nFinding Linear Recurrence...")
    # Convert to integers for BM algorithm
    int_seq = [int(x) for x in seq]
    coeffs = berlekamp_massey_mod(int_seq)
    
    if not coeffs:
        print("Could not find recurrence. Try increasing the range of n.")
        return

    print(f"Recurrence found (length {len(coeffs)}): {coeffs}")
    print("Recurrence form: X(2k) = c1*X(2(k-1)) + c2*X(2(k-2)) + ...")

    # Target: X(10^4). 
    # Our sequence is Y_k = X(2k). We want Y_{5000}.
    target_k = 10000 // 2
    ans = compute_nth_term(coeffs, int_seq, target_k)
    
    print(f"\nCalculated X(10000) modulo {MOD}:")
    print(ans)

def partitions(n, min_val=1):
    if n == 0:
        yield ()
        return
    for i in range(min_val, n + 1):
        for p in partitions(n - i, i):
            yield (i,) + p

def compute_expected_score(n):
    # 1. Generate all partitions of n
    parts = sorted([tuple(sorted(list(p))) for p in partitions(n)])
    state_map = {p: i for i, p in enumerate(parts)}
    dim = len(parts)
    
    # 2. Build the linear system (I - P)x = S
    # We use exact Fraction arithmetic
    mat = [[Fraction(0) for _ in range(dim)] for _ in range(dim)]
    rhs = [Fraction(0) for _ in range(dim)]
    
    for i, p in enumerate(parts):
        if len(p) == 1:
            # Absorbing state (all cards in one pile)
            mat[i][i] = Fraction(1, 1)
            rhs[i] = Fraction(0, 1)
            continue
        
        # Diagonal element
        mat[i][i] += Fraction(1, 1)
        
        M = len(p)
        prob = Fraction(1, M * (M - 1))
        
        for pick_idx in range(M):
            for target_idx in range(M):
                if pick_idx == target_idx:
                    continue
                
                s_pick = p[pick_idx]
                s_target = p[target_idx]
                
                # Next state construction
                next_p_list = []
                # Keep untouched piles
                for k in range(M):
                    if k != pick_idx and k != target_idx:
                        next_p_list.append(p[k])
                
                # Add target pile + 1
                next_p_list.append(s_target + 1)
                
                # Add (s_pick - 1) piles of size 1
                for _ in range(s_pick - 1):
                    next_p_list.append(1)
                
                next_state = tuple(sorted(next_p_list))
                j = state_map[next_state]
                
                # Calculate XOR score of the NEXT state
                score = 0
                for x in next_state:
                    score ^= x
                
                # Equation: x_i = sum(prob * (score + x_j))
                # x_i - sum(prob * x_j) = sum(prob * score)
                mat[i][j] -= prob
                rhs[i] += prob * score

    # 3. Gaussian Elimination with Fractions
    res = gauss_elimination(mat, rhs)
    
    # Return value for state {1, 1, ..., 1}
    start_node = tuple([1]*n)
    return res[state_map[start_node]]

def gauss_elimination(A, b):
    n = len(A)
    # Forward elimination
    for i in range(n):
        # Pivot
        pivot = A[i][i]
        # If pivot is 0, swap with a lower row (should not happen in this well-behaved chain)
        if pivot == 0:
            for k in range(i+1, n):
                if A[k][i] != 0:
                    A[i], A[k] = A[k], A[i]
                    b[i], b[k] = b[k], b[i]
                    pivot = A[i][i]
                    break
        
        for j in range(i + 1, n):
            if A[j][i] != 0:
                factor = A[j][i] / pivot
                for k in range(i, n):
                    A[j][k] -= factor * A[i][k]
                b[j] -= factor * b[i]
                
    # Back substitution
    x = [Fraction(0)] * n
    for i in range(n - 1, -1, -1):
        sum_ax = sum(A[i][j] * x[j] for j in range(i + 1, n))
        x[i] = (b[i] - sum_ax) / A[i][i]
        
    return x

def berlekamp_massey_mod(sequence):
    """Berlekamp-Massey algorithm working with integers modulo MOD"""
    n = len(sequence)
    b = [1]
    c = [1]
    l = 0
    m = -1
    dm = 1
    
    for i in range(n):
        d = sequence[i] % MOD
        for j in range(1, min(l + 1, len(c))):
            if i - j >= 0:
                d = (d + c[j] * sequence[i - j]) % MOD
            
        if d == 0:
            m += 1
            continue
            
        t = c[:]
        # Find modular inverse of dm
        dm_inv = pow(dm, MOD - 2, MOD)
        mult = (d * dm_inv) % MOD
        
        if len(c) < len(b) + (i - m):
            c.extend([0] * (len(b) + (i - m) - len(c)))
            
        for j in range(len(b)):
            c[j + (i - m)] = (c[j + (i - m)] - mult * b[j]) % MOD
            
        if 2 * l <= i:
            l = i + 1 - l
            b = t
            m = i
            dm = d
        else:
            m += 1
            
    # The coefficients are -c[1], -c[2], ...
    res = [(-x) % MOD for x in c[1:]]
    return res

def berlekamp_massey(sequence):
    # Berlekamp-Massey algorithm for finding linear recurrence
    # sequence: list of Fraction or int
    
    n = len(sequence)
    b = [Fraction(1)]
    c = [Fraction(1)]
    l = 0
    m = -1
    dm = Fraction(1)
    
    for i in range(n):
        d = sequence[i]
        for j in range(1, min(l + 1, len(c))):
            if i - j >= 0:
                d += c[j] * sequence[i - j]
            
        if d == 0:
            m += 1
            continue
            
        t = c[:]
        mult = d / dm
        
        if len(c) < len(b) + (i - m):
            c.extend([Fraction(0)] * (len(b) + (i - m) - len(c)))
            
        for j in range(len(b)):
            c[j + (i - m)] -= mult * b[j]
            
        if 2 * l <= i:
            l = i + 1 - l
            b = t
            m = i
            dm = d
        else:
            m += 1
            
    # The coefficients are -c[1], -c[2], ...
    # We return them as integers modulo MOD (assuming the recurrence is integer-based)
    res = []
    for x in c[1:]:
        val = -x
        # We assume the recurrence coefficients are integers.
        if val.denominator != 1:
            print("Warning: Recurrence coefficients are not integers.")
        res.append(int(val.numerator) % MOD) # Take numerator mod MOD
    return res

def mat_mul(A, B, size):
    C = [[0]*size for _ in range(size)]
    for i in range(size):
        for k in range(size):
            if A[i][k] == 0: continue
            for j in range(size):
                C[i][j] = (C[i][j] + A[i][k] * B[k][j]) % MOD
    return C

def mat_pow(A, p, size):
    res = [[0]*size for _ in range(size)]
    for i in range(size): res[i][i] = 1
    base = A
    while p > 0:
        if p % 2 == 1:
            res = mat_mul(res, base, size)
        base = mat_mul(base, base, size)
        p //= 2
    return res

def compute_nth_term(coeffs, init_seq, target_k):
    """
    Compute the target_k-th term using matrix exponentiation.
    init_seq: Y_1, Y_2, ...
    target_k: index we want (1-based)
    """
    order = len(coeffs)
    if target_k <= len(init_seq):
        return init_seq[target_k-1] % MOD
        
    # Matrix State: [Y_k, Y_{k-1}, ... Y_{k-order+1}]^T
    # Transition M:
    # [c1, c2, ..., c_order]
    # [1,  0,  ..., 0]
    # ...
    
    M = [[0]*order for _ in range(order)]
    for i in range(order):
        M[0][i] = coeffs[i] % MOD
    for i in range(1, order):
        M[i][i-1] = 1
        
    # We start at state corresponding to the end of init_seq
    # Vector V_start = [Y_{L}, Y_{L-1}, ... ]
    L = len(init_seq)
    
    # We need to advance by (target_k - L) steps
    steps = target_k - L
    
    M_p = mat_pow(M, steps, order)
    
    # Start vector (reversed from end of sequence)
    start_vec = [init_seq[L-1-i] % MOD for i in range(order)]
    
    final_val = 0
    for i in range(order):
        final_val = (final_val + M_p[0][i] * start_vec[i]) % MOD
        
    return final_val

if __name__ == "__main__":
    solve()