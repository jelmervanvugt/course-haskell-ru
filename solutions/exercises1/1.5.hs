type Name             = String
type Age              = Integer
type FavouriteCourse  = String

type Person           = (Name, Age, FavouriteCourse)

elena, peter, pol, frits :: Person
elena   = ("Elena", 33, "Functional Programming")
peter   = ("Peter", 33, "Imperative Programming")
pol     = ("Pol", 36, "Quantum Field Theory")
frits   = ("Frits", 38, "Operating Systems")

-- 1
jelmer  = ("Jelmer", 4, "The Main Course")
eric    = ("Eric", 42, "Yet unknown")

students :: [Person]
students = [elena, peter, pol, frits, jelmer, eric]

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
increaseAge p = (name p, (age p) + 1, favouriteCourse p)

--6
-- Testing of functions can be done by calling main in GHCi paired with the right function
-- !! n gets the Nth value in the list, in this case the first one

--main = putStr (favouriteCourse(students !! 0))

{- increment the age of all students by two -}
-- (map increaseAge (map increaseAge students))

{- promote all of the students -}
promote :: Person -> Person
promote p = (("dr. " ++ name p), age p, favouriteCourse p)
-- map promote students

{- find all students named Frits -}
-- let isFrits p = (name p) == "Frits" in filter isFrits students

{- find all students who are in their twenties -}
-- let inTwenties p = (age p) >= 20 && (age p) < 30 in filter inTwenties students

{- compute the average age of all students -}
averageAge s = (fromIntegral(sum (map age s)) `div` (length s))

{- promote all students whose favourite course is functional programming -}
promoteIfFavourite :: Person -> Person
promoteIfFavourite s =
    if fpFav then promote s else s
    where fpFav = favouriteCourse s == "Functional Programming"
--main = putStr(show (map promoteIfFavourite students))




