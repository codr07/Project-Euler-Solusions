package main

import "fmt"

func main() {
	N := 12
	pts := make([][2]int, 0)

	for x := -N; x <= N; x++ {
		for y := -N; y <= N; y++ {
			if x*x+y*y < N*N {
				pts = append(pts, [2]int{x, y})
			}
		}
	}

	var T int64 = 0
	S := len(pts)

	for i := 0; i < S; i++ {
		x1, y1 := pts[i][0], pts[i][1]
		r1 := int64(x1*x1 + y1*y1)

		for j := 0; j < S; j++ {
			if i == j { continue }
			x2, y2 := pts[j][0], pts[j][1]
			r2 := int64(x2*x2 + y2*y2)

			for k := 0; k < S; k++ {
				if i == k || j == k { continue }
				x3, y3 := pts[k][0], pts[k][1]
				r3 := int64(x3*x3 + y3*y3)

				det := int64(x1)*(int64(y2)*r3-int64(y3)*r2) -
					int64(y1)*(int64(x2)*r3-int64(x3)*r2) +
					r1*(int64(x2)*int64(y3)-int64(x3)*int64(y2))

				if det == 0 {
					T++
				}
			}
		}
	}

	fmt.Println(T)
}
