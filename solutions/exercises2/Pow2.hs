module Pow2 where

pow2 :: (Ord n, Num n, Num a) => n -> a
pow2 0 = 1
-- pow2 n = 2 * (pow2 (n-1))
pow2 n
 | n < 1 = 2 ^^ fromIntegral(n)
 | otherwise = 2 * (pow2 (n-1))

{- Type    | Maximum n
 - -------------------
 - Integer | \infty
 - Int     | 62 (pow2 63 is negative)
 - Float   | 127
 - Double  | 1023
-}
