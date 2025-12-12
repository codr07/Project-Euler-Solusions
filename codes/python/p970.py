# 
# Shared code for solutions to Project Euler problems
# Copyright (c) Sankha Saha. All rights reserved.
import math
import cmath

def lambertw_branch(z, k, maxit=100, tol=1e-15):
    r = abs(z)
    theta = cmath.phase(z)
    w = math.log(r) + 1j * (theta + 2 * math.pi * k)
    for _ in range(maxit):
        ew = cmath.exp(w)
        f = w * ew - z
        fp = ew * (w + 1)
        dw = f / fp
        w_new = w - dw
        if abs(dw) < tol * (1 + abs(w_new)):
            return w_new
        w = w_new
    return w

def first_non6_digits_for_N(N, answer_len=8, block_len=128):
    z = -math.exp(-1.0)
    w1 = lambertw_branch(z, 1)
    rho = 1 + w1
    Dprime = 1 - cmath.exp(-rho)

    re_rho = rho.real
    im_rho = rho.imag
    ln10 = math.log(10.0)

    # approx log10(eps_N)
    log10_eps = (re_rho * N + math.log(2.0 / abs(Dprime))) / ln10

    # First changed digit is around position K0, then we center a block of length block_len
    K0 = int(math.floor(-log10_eps))
    J = K0 + block_len // 2

    # eps_N * 10^J = 2 Re( exp(rho N + J ln 10) / D'(rho) )
    real_alpha = re_rho * N + J * ln10
    imag_alpha = im_rho * N
    exp_alpha = cmath.exp(real_alpha + 1j * imag_alpha)
    z_scaled = exp_alpha / Dprime
    delta = 2.0 * z_scaled.real

    # int shift B
    B = int(math.floor(2.0 / 3.0 + delta))

    M = 10**block_len
    S = (M - 1) * 2 // 3
    D_int = (S + B) % M
    s = f"{D_int:0{block_len}d}"

    # read digits that are not 6
    out = []
    for ch in s:
        if ch != '6':
            out.append(ch)
            if len(out) == answer_len:
                break
    return ''.join(out)

print(first_non6_digits_for_N(10**6))