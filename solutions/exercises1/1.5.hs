type Name             = String
type Age              = Integer
type FavouriteCourse  = String

type Person           = (Name, Age, FavouriteCourse)

-- TODO: ff je eigen favo course toevoegen ;)
elena, peter, pol :: Person
elena   = ("Elena", 33, "Functional Programming")
peter   = ("Peter", 33, "Imperative Programming")
pol     = ("Pol", 36, "Object Oriented Programming")

-- 1
jelmer  = ("Jelmer", 4, "The Main Course")
eric    = ("Eric", 42, "Yet unknown")

students :: [Person]
students = [elena, peter, pol]

-- 2
age :: Person -> Age
age (_, n, _) = n

name :: Person -> Name
name (n, _, _) = n

favouriteCourse :: Person -> FavouriteCourse
favouriteCourse (_, _, c) = c

-- 3
showPerson :: Person -> String
showPerson p  = "Name: " ++ name p ++ " \n Age: " ++ show (age p) ++ " \n Favourite Course: " ++ favouriteCourse p

-- 4
twins :: Person -> Person -> Bool
twins p1 p2
  | age p1 == age p2 = True
  | otherwise = False

-- 5
increaseAge :: Person -> Person
// TODO verder implementeren

-- Testing of functions can be done by calling main in GHCi paired with the right function
-- !! n gets the Nth value in the list, in this case the first one

--main = putStr (favouriteCourse(students !! 0))
main = putStr (show (twins elena peter))




