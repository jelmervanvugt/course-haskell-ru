{-

    Operator / Function takes two lists and creates a new list in which the head of both lists are added in turn. 
    The first argument gets it's head inserted in the new list first. The functions keeps adding items to the new
    list till one of the list runs out of items. When one does it appends the rest of the list that is list to the
    tail of the new one.

    Reduction of function shown below:

    [1,2,3]     ++/     [4,5]
    [1]         ++      [4,5] ++\ [2,3]
    [4]         ++      [2,3] ++\ [5]
    [2]         ++      [5] ++\ [3]
    [5]         ++      [3] ++\ []
    [3]         ++      [] ++\ [] 
    List is empty, retracing function call stack and appending list
    Makes: [1,4,2,5,3]

-}

(++/) :: [a] -> [a] -> [a]
[] ++/ ys = ys
(x:xs) ++/ ys = x:(ys ++/ xs)