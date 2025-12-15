import Data.List

n = 12

inside (x, y) = x * x + y * y < n * n

points = [(x, y) | x <- [-n .. n], y <- [-n .. n], inside (x, y)]

det (x1, y1) (x2, y2) (x3, y3) =
  x1 * (y2 * (x3 * x3 + y3 * y3) - y3 * (x2 * x2 + y2 * y2))
    - y1 * (x2 * (x3 * x3 + y3 * y3) - x3 * (x2 * x2 + y2 * y2))
    + (x1 * x1 + y1 * y1) * (x2 * y3 - x3 * y2)

main =
  print $
    sum
      [ 1 | p <- points, q <- points, p /= q, r <- points, q /= r, p /= r, det p q r == 0
      ]
