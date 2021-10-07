module Lego where

import Data.List
import Data.Tuple

removeAt :: Int -> [a] -> [a]
removeAt i xs = [ y | (x,y) <- zip [0..] xs, x /= i ]

sortWithPos :: (Ord a) => [a] -> [(a,Int)]
sortWithPos xs = [ (x,y) | (x,y) <- sortOn fst ( zip xs [1..] ) ]

sortedPos :: (Ord a) => [a] -> [(a,Int)]
sortedPos xs = [ (x,z) | ((x,y),z) <- sortOn (snd . fst) ( zip (sortWithPos xs) [1..] ) ]


