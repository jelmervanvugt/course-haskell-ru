uniq :: (Eq a) => [a] -> [a]    

uniq [] = [];
uniq [x] = [x];
uniq (x1:x2:xs) 
    | x1 == x2 = uniq (x2:xs)
    | otherwise = x1 : uniq (x2:xs)

test = ['g','o','o','d','b','y','e',',',' ','h','e','l','l','o'];

main = putStr (show(uniq test))