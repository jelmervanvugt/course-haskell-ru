isGreaterThan :: Integer -> Integer -> Integer
isGreaterThan m n
    | m < n     = m
    | otherwise = n

printMultipleTimes :: String -> Integer -> String
printMultipleTimes s n
    | n <= 0    = ""
    | otherwise = s ++ printMultipleTimes s (n-1)

modulus :: Integer -> Integer -> Integer
modulus x 0 = x
modulus x y = modulus y (x `mod` y)