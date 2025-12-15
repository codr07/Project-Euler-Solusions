import kotlin.math.*
import kotlin.complex.Complex

fun lambertW(z: Complex, k: Int): Complex {
    var w = Complex(ln(z.abs()), z.phase + 2*PI*k)
    repeat(50) {
        val ew = w.exp()
        w -= (w*ew - z)/(ew*(w + Complex(1.0,0.0)))
    }
    return w
}
