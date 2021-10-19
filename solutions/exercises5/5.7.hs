
import Data.List (unfoldr)
import Prelude hiding (take,zip,(++))

-- 1
bits :: Int -> [Int]
bits = unfoldr go 
  where 
  go 0 = Nothing 
  go n = Just (n `mod` 2, n `div` 2) 

-- 2
zip :: [a] -> [b] -> [(a,b)]
zip a b = unfoldr go (a, b)
    where 
        go (_, []) = Nothing 
        go ([], _) = Nothing 
        go (a:as, b:bs) = Just ((a,b), (as, bs))

-- 3
take :: Int -> [a] -> [a]
take a b = unfoldr go (a, b)
    where 
        go (0, _) = Nothing 
        go (_, []) = Nothing 
        go (a, b:bs) = Just (b, (a-1, bs))

-- 4
primes :: [Integer]
primes = unfoldr go [2..]
    where 
        go [] = Nothing 
        go (x:xs) = Just  (x, [ n | n <- xs, n `mod` x /= 0 ])

-- 5
apo :: (t -> Either [a] (a, t)) -> t -> [a]
apo f seed = case f seed of
               Left l       -> l
               Right (a,ns) -> a : apo f ns

(++) :: [a] -> [a] -> [a]
(++) a b = apo go a 
  where
  go [] = Left b 
  go (x:xs) = Right (x,xs)

-- 6
insert :: (Ord a) => a -> [a] -> [a]
insert x = apo go 
    where 
        go [] = Left [x]
        go (x:xs) = Right (x, xs)

-- 7
unfoldrApo :: (t -> Maybe (a, t)) -> t -> [a]
unfoldrApo a = apo (left . a) 
  where 
  left Nothing  = Left []
  right (Just x) = Right x