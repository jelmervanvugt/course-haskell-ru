import Prelude hiding (and,or,elem,maximum)

-- 1
and :: [Bool] -> Bool
and = foldl (&&) True

-- 2
or :: [Bool] -> Bool
or = foldl (||) False

-- 3
elem :: (Eq a) => a -> [a] -> Bool
elem x = foldr (\a b -> b || x == a) False 

-- 3
maximum :: (Ord a) => [a] -> a
maximum xs = foldr (\a b -> if b > a then b else a) (head xs) xs

-- 4
fromList :: (Ord a) => [a] -> Tree a
fromList = foldr (\a b -> insert a b) Leaf

-- 5
fromBits :: [Integer] -> Integer
fromBits xs = foldl (\a b -> a * 2 + b) 0 (reverse xs)

{- -------------------------------------------------------------------}

-- the relevant definitions for 'fromList'

data Tree a = Leaf | Node a (Tree a) (Tree a) deriving Show

insert :: (Ord a) => a -> Tree a -> Tree a
insert x Leaf = Node x Leaf Leaf
insert x tree@(Node key lt rt)
  | x < key   = Node key (insert x lt) rt
  | x > key   = Node key lt (insert x rt)
  | otherwise = tree







