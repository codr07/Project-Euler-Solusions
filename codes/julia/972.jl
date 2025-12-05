N = 12
pts = [(x,y) for x=-N:N, y=-N:N if x*x + y*y < N*N]

function det(p,q,r)
    x1,y1 = p
    x2,y2 = q
    x3,y3 = r
    r1 = x1*x1+y1*y1
    r2 = x2*x2+y2*y2
    r3 = x3*x3+y3*y3
    return x1*(y2*r3-y3*r2) -
           y1*(x2*r3-x3*r2) +
           r1*(x2*y3-x3*y2)
end

T=0
for p in pts, q in pts, r in pts
    if p!=q && q!=r && p!=r
        T += det(p,q,r)==0
    end
end
println(T)
