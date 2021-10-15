
-- 1
onlyElem :: (Eq a) => a -> [a] -> Bool
onlyElem x xs = length (filter ( == x ) xs) == 1


-- 2
onlyOnce :: (a -> Bool) -> [a] -> Bool
onlyOnce f xs =  length (filter (==True) (map f xs)) == 1


-- 3
onlyOnce' :: (a -> Bool) -> [a] -> Bool
onlyOnce' f xs = length (filter f xs) == 1
