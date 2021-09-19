-- 1

swap :: (Int, Int) -> (Int, Int)
swap (x, y) = (y, x)

timesTwo :: (Int, Int) -> (Int, Int)
timesTwo (x, y) = (y * 2, x * 2)

modulo10 :: (Int, Int) -> (Int, Int)
modulo10 (x, y) = (y `mod` 10, x `mod` 10)


-- 2

{- This wont make any difference, for all functions. As long as the order of the variables is the same. -}

-- 3

{-  GHCi infers the following type declarations:

    - swap :: (b, a) -> (a, b)
    - timesTwo :: (Num a, Num b) => (a, b) -> (b, a)
    - modulo10 :: (Integral a, Integral b) => (a, b) -> (b, a)  
    
    This is because the Haskell automatically types the outcome of a (*) expresion to a Num and a (%) expression to an Integral.
    With a type declaration this can be suppressed, but without the :type the two functions will be different. -}

--4
{-  The first type declaration encapsulates the Char and Boolean into a tupel, the second does not.  
    Below I've constructed a function to converts one datatype to another   -}

format :: (Int, (Char, Bool)) -> (Int, Char, Bool)
format (a, (b, c)) = (a, b, c)

main = putStr(show (swap (5, 6)))