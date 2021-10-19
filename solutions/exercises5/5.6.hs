
-- 1
compose :: [a -> a] -> (a -> a)
compose = foldr (.) id

compose' :: [a -> a] -> (a -> a)
compose' [] = id 
compose' (x:xs) = x . compose xs

-- 2
foo :: (Integral n) => n -> n
foo n = compose (map (*) [1..n]) 1
{-
    The function above calculates the product of an integer list taking the form [1..n].
    Because it uses the compose function it starts from the right and works its way to the left till it reaches the base case, which is 1.

    When passing 5 as a variable the function will work as follows:

    (1 * (2 * (3 * (4 * ( 5 * (1)))))) = 120
-}

-- 3
foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' f b x = compose (map f x) b 


main :: IO()
main = putStr (show (foo 5))