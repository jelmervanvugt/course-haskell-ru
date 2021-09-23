import Prelude hiding (or, and, elem, take, drop)

and :: [Bool] -> Bool
and [] = True
and (x:xs) = if x == False then False else and xs

or :: [Bool] -> Bool
or [] = True
or (x:xs) = if x == True then True else or(xs)

elem :: (Eq a) => a -> [a] -> Bool
elem a [] = False
elem a (x:xs) = if a == x then True else elem a xs

drop :: Int -> [a] -> [a]
drop i [] = []
drop i (x:xs)
    | i < 0 = error "Negative index value"
    | i > length (x:xs) = error "Index can't exceed list size"
    | i == 0 = x:xs
    | otherwise = drop (i - 1) xs

take :: Int -> [a] -> [a]
take i [] = []
take i (x:xs)
    | i < 0  = error "Negative index value"
    | i > length (x:xs) = error "Index can't exceed list size"
    | i == 1 = [x]
    | otherwise = [x] ++ take (i - 1) xs
