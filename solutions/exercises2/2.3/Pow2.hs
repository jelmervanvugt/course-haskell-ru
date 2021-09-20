module Pow2 where

-- 1 / 2
pow2 :: (Ord n, Num n, Num a) => n -> a
pow2 n 
    | n == 0 = 1
    | n == 1 = 2
    | otherwise = 2 * pow2(n - 1)

-- The original function still works in combination with the new overloaded type declaration.

-- 3
{-
    Max. value Int in Haskell       : 2.147.483.647
    Max. value Integer in Haskell   : Unbounded
    Max. value Float in Haskell     : 1.7976931348623158 E + 308
    Max. value Double in Haskell    : 1.7976931348623158 E + 308

    Int can hold a max. of          : 2^62 (2^63 is negative)
    Integer can hold a max. of      : Infinity
    Float can hold a max. of        : 2^127
    Double can hold a max. of       : 2^1023
-}
