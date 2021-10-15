import Prelude hiding (const)

{-
    Function takes a number and first adds 1 to it and multiplies it by 5.
    After calculating it returns the result.
-}
f1 :: (Num a) => a -> a
f1 = (* 5) . (+ 1)

{-
   Function takes a number and first multiplies it by 5.
   After multiplying it adds one to the result and returns the calculated value. 
-}
f2 :: (Num a) => a -> a
f2 = (+ 1) . (* 5)

{-
    Function takes a number and checks if it is greater than or equal to 0 and lower than or equal than 100.
    If the value satisfies the criteria the number is returned. If it is lower than 0, 0 is returned.
    If it is greater than 100, 100 is returned. 
-}
f3 :: (Num a, Ord a) => a -> a
f3 = (min 100) . (max 0)

{-
    Function takes a list of type a and checks if its length is lower than 5.  

    When changing the (<5) to (5<) the function checks if the list is greater than 5.
    When changing to ((<)5) the function is the same as the original.         
-}
f4 :: [a] -> Bool
f4 = (<5) . length





