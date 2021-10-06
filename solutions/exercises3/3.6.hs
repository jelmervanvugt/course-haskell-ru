module ListComprehensions where

import Data.List

{-
    g0 :: [a] -> [b] -> [(a,b)]

    Takes pairs of 2 out of list bs and as and stores them in a tupel. 
    Then returns a list containing said tuples.

    A better name would be zip.
-}
g0 as bs = [ (a,b) | a <- as, b <- bs ]

{-
    g1 :: (Num t, Enum t) => t -> a -> [a]

    Creates a list of positive integers and applies them to every item in y.

    A better name would be map.
-}
g1 n y   = [ y | i <- [1..n] ]

{-
    g2 :: (Num a1, Enum a1, Ord a1) => a1 -> [a2] -> [a2]

    Function takes all values from a given list and pairs them with an index.
    After it returns all values up until index i.

    A better name would be take.
-}
g2 n xs  = [ x | (i,x) <- zip [0..] xs, i < n ]

{-
    g3 :: (Num a1, Enum a1, Eq a2) => a2 -> [a2] -> [a1]   

    Function takes all values from a given list and pairs them with an index.
    After it checks which values are equal to a and returns their indexes.

    A better name would be compare.
-}
g3 a xs  = [ i | (i,x) <- zip [0..] xs, x == a]

{-
    g4 :: [a] -> [a] -> [a]   

    Function takes two lists and zips them.
    After it concatenates the tuples and returns a list.

    A better name would be concatZip.
-}
g4 xs ys = [ e | (x,y) <- zip xs ys, e <- [x,y] ]

{-
    g5 :: [[a]] -> [a]  

    Function takes a twodimensional list and appends it into a onedimensional one.

    A better name would be concat2dList.
-}
g5 xss   = [ x | xs <- xss, x <- xs ]


