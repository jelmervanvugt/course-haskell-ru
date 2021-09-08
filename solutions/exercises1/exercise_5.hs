module Database where

type Person = (Name, Age, FavouriteCourse)

type Name             = String
type Age              = Integer
type FavouriteCourse  = String

elena, peter, pol :: Person
elena  =  ("Elena",  33,  "Functional Programming")
peter  =  ("Peter",  57,  "Imperative Programming")
pol    =  ("Pol",    36,  "Object Oriented Programming")
et     =  ("ET",     36,  "Quantum Field Theory")

students :: [Person]
students = [elena, peter, pol, et]

age :: Person -> Age
age (_, n, _)  =  n

name             :: Person -> Name
name (n, _, _) = n

favouriteCourse  :: Person -> FavouriteCourse
favouriteCourse (_ ,_ ,fc) = fc

showPerson       :: Person -> String
showPerson p = show (name p) ++ " aged " ++ show (age p) ++ " likes " ++ show (favouriteCourse p) ++ "\n"

twins            :: Person -> Person -> Bool
twins p1 p2 = (age p1) == (age p2)

increaseAge      :: Person -> Person
increaseAge p = (name p, (age p) + 1, favouriteCourse p)

{-
 - Misc expressions
 -}

promote :: Person -> Person
promote p = ("dr. " ++ (name p), (age p), (favouriteCourse p))

{- increment the age of all students by two -}
-- (map increaseAge (map increaseAge students))

{- promote all of the students -}
-- map promote students

{- find all students named Frits -}
-- let isFrits p = (name p) == "Frits" in filter isFrits students

{- find all students who are in their twenties -}
-- let inTwenties p = (age p) >= 20 && (age p) < 30 in filter inTwenties students
