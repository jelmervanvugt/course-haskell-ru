import Prelude hiding (reverse)

reverse :: [a] -> [a]
reverse [] = []
reverse (x:xs) = reverse xs ++ [x]

reverse' :: [a] -> [a]
reverse' xs = rev xs []
  where rev []     acc = acc
        rev (y:ys) acc = rev ys (y:acc)

{-
    I personally prefer the the first implementation of reverse. I think it's easier to read and understand than the other one
    and requires less code. The advantage of the second function however is that it doesn't need any post processing after re-
    aching the base-case. The above one needs to back track the entire stacktrace before it can return the final result.
-}