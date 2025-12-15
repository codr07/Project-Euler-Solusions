import Foundation

let N = 12
var pts = [(Int,Int)]()

for x in -N...N {
    for y in -N...N {
        if x*x + y*y < N*N {
            pts.append((x,y))
        }
    }
}

var T: Int64 = 0

for i in 0..<pts.count {
    let (x1,y1) = pts[i]
    let r1 = x1*x1+y1*y1
    for j in 0..<pts.count {
        if i == j { continue }
        let (x2,y2) = pts[j]
        let r2 = x2*x2+y2*y2
        for k in 0..<pts.count {
            if i == k || j == k { continue }
            let (x3,y3) = pts[k]
            let r3 = x3*x3+y3*y3

            let det = Int64(x1)*(Int64(y2)*Int64(r3)-Int64(y3)*Int64(r2))
                    - Int64(y1)*(Int64(x2)*Int64(r3)-Int64(x3)*Int64(r2))
                    + Int64(r1)*(Int64(x2)*Int64(y3)-Int64(x3)*Int64(y2))

            if det == 0 { T += 1 }
        }
    }
}

print(T)
