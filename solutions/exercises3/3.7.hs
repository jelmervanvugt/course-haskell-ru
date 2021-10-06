module Lego where

import Data.List
import Data.Tuple

removeAt :: Int -> [a] -> [a]
removeAt i xs = [ y | (x,y) <- zip [0..] xs, x /= i ]

-- NOTE : doesnt return e for some reason
sortWithPos :: (Ord a) => [a] -> [(a,Int)]
sortWithPos xs = [ (x,y) | (x,y) <- sortOn fst ( zip xs [1..] ) ]

-- NOTE : doesnt work yet
-- sortedPos :: (Ord a) => [a] -> [(a,Int)]
-- sortedPos xs = [ e | y <- sort xs, z <- zip y [0..], e <-  ]
