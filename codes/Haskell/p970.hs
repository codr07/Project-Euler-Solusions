import Data.Complex

lambertW :: Complex Double -> Int -> Complex Double
lambertW z k = iterateNewton w0 !! 30
  where
    r = magnitude z
    t = phase z
    w0 = log r :+ (t + 2*pi*fromIntegral k)
    iterateNewton w =
      let ew = exp w
          f  = w*ew - z
          fp = ew*(w+1)
      in w - f/fp
