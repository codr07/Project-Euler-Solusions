use num_complex::Complex;
use std::f64::consts::PI;

fn lambertw(z: Complex<f64>, k: i32) -> Complex<f64> {
    let r = z.norm();
    let theta = z.arg();
    let mut w = Complex::new(r.ln(), theta + 2.0*PI*(k as f64));

    for _ in 0..50 {
        let ew = w.exp();
        let f  = w*ew - z;
        let fp = ew*(w + Complex::new(1.0,0.0));
        w -= f/fp;
    }
    w
}
