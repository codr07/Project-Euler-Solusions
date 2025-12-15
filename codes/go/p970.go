package main

import (
	"fmt"
	"math"
	"math/cmplx"
)

func lambertW(z complex128, k int) complex128 {
	r := cmplx.Abs(z)
	theta := cmplx.Phase(z)
	w := complex(math.Log(r), theta+2*math.Pi*float64(k))

	for i := 0; i < 100; i++ {
		ew := cmplx.Exp(w)
		f := w*ew - z
		fp := ew * (w + 1)
		dw := f / fp
		w2 := w - dw
		if cmplx.Abs(dw) < 1e-15*(1+cmplx.Abs(w2)) {
			return w2
		}
		w = w2
	}
	return w
}

func main() {
	N := float64(1e6)
	z := -math.Exp(-1)
	w1 := lambertW(complex(z,0),1)
	rho := 1 + w1
	Dp := 1 - cmplx.Exp(-rho)

	re := real(rho)
	im := imag(rho)
	ln10 := math.Log(10)

	log10eps := (re*N + math.Log(2/cmplx.Abs(Dp))) / ln10
	K0 := math.Floor(-log10eps)
	J  := K0 + 64

	expa := cmplx.Exp(complex(re*N+J*ln10, im*N))
	delta := 2 * real(expa/Dp)

	B := math.Floor(2.0/3.0 + delta)
	fmt.Println(int64(B))
}
