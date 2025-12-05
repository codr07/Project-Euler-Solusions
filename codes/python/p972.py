# 
# Shared code for solutions to Project Euler problems
# Copyright (c) Sankha Saha. All rights reserved.

from itertools import product, permutations

N = 12
pts = [(x,y) for x,y in product(range(-N,N+1), repeat=2)
       if x*x + y*y < N*N]

def det(p,q,r):
    x1,y1 = p
    x2,y2 = q
    x3,y3 = r
    return (x1*(y2*(x3*x3+y3*y3)-y3*(x2*x2+y2*y2))
          - y1*(x2*(x3*x3+y3*y3)-x3*(x2*x2+y2*y2))
          + (x1*x1+y1*y1)*(x2*y3-x3*y2))

T = 0
for p,q,r in permutations(pts,3):
    if det(p,q,r) == 0:
        T += 1

print(T)
