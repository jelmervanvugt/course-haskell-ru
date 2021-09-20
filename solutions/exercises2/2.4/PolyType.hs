module PolyType where

f8 x y  = if x <= y then x else y

f9 x y  = not x || y

f10 x y
  | x == 0    = y
  | otherwise = x + y

f11 x y = get 0
  where get n = if n == 0 then x else y

 -- 1 
{- Both function f8 and f11 -}

-- 2
{-
  
    - f8 is ad hoc polymorphic. It only works for types which are comparable (Ord).
    - f9 is not polymorphic. It only works for Boolean types.
    - f10 is ad hoc polymorpohic. It works for types that have equality testing (Eq).
    - f11 is parametric polymorphic.

-}
