import Data.List (tails)

n = 12

inside :: (Int, Int) -> Bool
inside (x,y) = x*x + y*y < n*n

points :: [(Int, Int)]
points = [(x,y) | x <- [-n..n], y <- [-n..n], inside (x,y)]

det :: (Int, Int) -> (Int, Int) -> (Int, Int) -> Int
det (x1,y1) (x2,y2) (x3,y3) =
    x1*(y2*(x3*x3+y3*y3)-y3*(x2*x2+y2*y2)) -
    y1*(x2*(x3*x3+y3*y3)-x3*(x2*x2+y2*y2)) +
    (x1*x1+y1*y1)*(x2*y3 - x3*y2)

-- Generate unique triples (combinations) from a list
triples :: [a] -> [(a,a,a)]
triples xs = [(x,y,z) | (x:ys) <- tails xs, (y:zs) <- tails ys, z <- zs]

main :: IO ()
main = print $ sum [1 | (p,q,r) <- triples points, det p q r == 0]
