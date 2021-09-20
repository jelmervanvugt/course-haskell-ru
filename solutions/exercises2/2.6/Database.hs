data Person = Person { name::String, age::Integer, favouriteCourse::String }

elena, peter, pol, frits :: Person
elena   = Person {name="Elena", age=33, favouriteCourse="Functional Programming"}
peter   = Person {name="Peter", age=33, favouriteCourse="Imperative Programming"}
pol     = Person {name="Pol",   age=36, favouriteCourse="Quantum Field Theory"}
frits   = Person {name="Frits", age=38, favouriteCourse="Operating Systems"}

-- 1
jelmer  = Person {name="Jelmer", age=4,  favouriteCourse="The Main Course"}
et    = Person {name="Eric",   age=42, favouriteCourse="Quantum Field Theory"}

students :: [Person]
students = [elena, peter, pol, frits, jelmer, et]

-- 3
showPerson :: Person -> String
showPerson p  = "Name: " ++ name p ++ " \n Age: " ++ show (age p) ++ " \n Favourite Course: " ++  favouriteCourse p

-- 4
twins :: Person -> Person -> Bool
twins p1 p2
  | age p1 == age p2 = True
  | otherwise = False

-- 5
increaseAge :: Person -> Person
increaseAge p = Person {name=(name p), age=((age p) + 1), favouriteCourse=(favouriteCourse p)}

--6
-- Testing of functions can be done by calling main in GHCi paired with the right function
-- !! n gets the Nth value in the list, in this case the first one

--main = putStr (favouriteCourse(students !! 0))

{- increment the age of all students by two -}
-- (map increaseAge (map increaseAge students))

{- promote all of the students -}
promote :: Person -> Person
promote p = Person {name=("dr. " ++ name p), age=(age p), favouriteCourse=(favouriteCourse p)}
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
