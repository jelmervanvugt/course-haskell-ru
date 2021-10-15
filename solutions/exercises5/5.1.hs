import Prelude hiding (const)

 -- 1
const :: p1 -> p2 -> p1
const x _y   = x

-- 2
($->) :: t1 -> (t1 -> t2) -> t2
x $-> y      = y x

-- 3
oper :: Fractional a => String -> a -> a -> a
oper "mul" n = (*n)
oper "div" n = (n/)
oper _     _ = error "not implemented"

-- 4
mapMap :: (a -> b) -> [[a]] -> [[b]]
mapMap f xs  = map (map f) xs

-- 5
without :: (a -> Bool) -> [a] -> [a]
without p    = filter (not . p)

-- 6
on :: (t1 -> t1 -> t2) -> (t3 -> t1) -> t3 -> t3 -> t2
on f g x y   = f (g x) (g y)


