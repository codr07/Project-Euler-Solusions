import Foundation
import ComplexModule

func lambertW(_ z: Complex<Double>, k: Int) -> Complex<Double> {
    let r = z.length
    let theta = z.phase
    var w = Complex(log(r), theta + 2*Double.pi*Double(k))

    for _ in 0..<50 {
        let ew = w.exp
        let f  = w*ew - z
        let fp = ew*(w + Complex(1,0))
        w -= f/fp
    }
    return w
}
