-- 1 / 2

{-
    Type            : [Integer]
    List notation   : [1, 2, 3, 4, 5]
    Head and tail   : 1:2:3:4:5:[]
                      _ __________  
-}
xs0 = [1,2,3] ++ 4:[5]

xs1 = [1:2:[3],[4,5]]
{-
    Type            : [[Integer]]
    List notation   : [[1, 2, 3], [4, 5]]
    Head and tail   : [1, 2, 3]:[4, 5]:[]
                      _________ _________
-}
xs2 = "abc"

{-
    Type            : [a]
    List notation   : []
    Head and tail   : []
                      __
-}
xs3 = []

{-
    Type            : [[a]]
    List notation   : [[], []]
    Head and tail   : []:[]:[]
                      __ _____
-}
xs4 = [[],[]]

{-
    Type            : [[[a]]]
    List notation   : [[[]]]
    Head and tail   : ([]:[]):[]
                       __ ______ 
-}
xs5 = [[]:[]]

{-
    Type            : [[a]]
    List notation   : [[]]
    Head and tail   : []:[]
                      __ __  

-}
xs6 = [[]++[]]

{-
    Type            : [[[a]]]
    List notation   : [[[]]]
    List notation   : [[[]]]
    Head and tail   : ([]:[]):[]            NOT ENTIRELY SURE ABOUT THIS ONE
                       __ ______ 
-}
xs7 = [[[]]]

xs9 = [1, 2, 3]

-- 3 
{- dunno -}

