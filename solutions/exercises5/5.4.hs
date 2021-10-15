
import Prelude hiding (all)

all :: (a -> Bool) -> [a] -> Bool 
all f [] = True
all f (x:xs) = f x && all f xs

