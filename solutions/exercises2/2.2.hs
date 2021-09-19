f0 :: (Char, Char) -> Bool
f0 (x, y) = x == 'F' && y == 'P'

f1 :: String -> String
f1 s = s ++ ", cruel world!"

f2 :: a -> (b,c) -> (c,a,b)
f2 x (y,z) = (z,x,y)

f3 :: Char -> Char
f3 ' ' = '_'
f3 c = c

 -- Because of the outcome of f1 i would think: [Char] -> [Char] -> [Char], but it is: String -> String -> String
f4 :: String -> String -> String
f4 x y
 | x == "" = y
 | otherwise = x

-- How does Haskell know x and y are of the same type?
f5 :: Bool -> b -> b -> (b, b)
f5 b x y = if b then (x,y) else (y,x)

f6 :: a -> b -> a
f6 x = \y -> x

f7 :: String -> String
f7 = ("Haskell" ++)
