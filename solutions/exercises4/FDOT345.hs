module FDOT345 where

data Tree a = Leaf | Node a (Tree a) (Tree a)
  deriving Show

{----------- exercise 4.3 -------------}

{-

    1) Node 'c' (Node 'a' (Leaf) (Node 'b' (Leaf) (Leaf))) (Node 'f' (Node 'd' (Leaf) (Leaf)) (Node 'g' (Leaf) (Leaf)))
       Also, yes. The tree depicted in the picture is a valid binary tree.

    2) See 'BinaryTree4.3.jpg'             

-}

test = Node 'c' (Node 'a' (Leaf) (Node 'b' (Leaf) (Leaf))) (Node 'f' (Node 'd' (Leaf) (Leaf)) (Node 'g' (Leaf) (Leaf)))

leaves :: Tree a -> Int
leaves (Node a b c) = leaves b + leaves c
leaves Leaf = 1

nodes  :: Tree a -> Int
nodes (Node a b c) = (leaves b + leaves c) - 1
nodes Leaf = 0

height :: Tree a -> Int
height Leaf = 0
height (Node a b c) = if height b >= height c then height b + 1 else height c + 1

elems  :: Tree a -> [a]
elems Leaf = []
elems (Node a b c) = [a] ++ elems b ++ elems c

isSearchTree :: (Ord a) => Tree a -> Bool
isSearchTree Leaf = True 
isSearchTree (Node a b c) = all (< a) (elems b) && all (> a) (elems c) && isSearchTree b && isSearchTree c 


{----------- exercise 4.4 -------------}

-- Throughout these solutions I have not accounted for duplicates, since ex. 4.3 stated there are none.

member :: (Ord a) => a -> Tree a -> Bool
member x Leaf = False 
member x (Node a b c) = x == a || member x b || member x c 

insert :: (Ord a) => a -> Tree a -> Tree a
insert x Leaf = Node x Leaf Leaf
insert x (Node a b c)
  | x > a = Node a b (insert x c)
  | x < a = Node a (insert x b) c
  | x == a = Node a b c 
  | otherwise = error "An error occured while trying to insert value in binary search tree."

fromList :: (Ord a) => [a] -> Tree a
fromList [] = Leaf
fromList [x] = insert x Leaf
fromList xs = insert (head xs) (fromList (tail xs))
  
delete :: (Ord a) => a -> Tree a -> Tree a
delete x Leaf = Leaf 
delete x (Node a b c) 
  | x == a = delete' (Node a b c)
  | x > a = Node a b (delete x c)
  | x < a = Node a (delete x b) c

delete' :: (Ord a) => Tree a -> Tree a 
delete' (Node a Leaf c) = c
delete' (Node a b Leaf) = b
delete' (Node a b c) = Node x b c
 where x = getLeftistElement c

getLeftistElement :: (Ord a) => Tree a -> a
getLeftistElement (Node a Leaf _) = a
getLeftistElement (Node _ a _) = getLeftistElement a


{----------- exercise 4.5 -------------}

inOrder :: Tree a -> [a]
inOrder Leaf = []
inOrder (Node a b c) = inOrder b ++ [a] ++ inOrder c

fromAscList :: [a] -> Tree a
fromAscList [x] = Node x Leaf Leaf 
fromAscList [x, y] = Node y (Node x Leaf Leaf) Leaf
fromAscList x = Node nodeVal (fromAscList (init (fst sections))) (fromAscList (snd sections)) 
  where midPos = length x `div` 2
        nodeVal = x !! midPos
        sections = splitAt midPos x


breadthFirst :: Tree a -> [a]
breadthFirst s = discovered ++ findNeighbours s
 where items = tail (elems test) 
       discovered = head (elems test)


findNeighbours :: Tree a -> [a]
findNeighbours Leaf = []
findNeighbours (Node a (Node b c d) Leaf) = [b]
findNeighbours (Node a Leaf (Node b c d)) = [b]
findNeighbours (Node a (Node b c d) (Node e f g)) = b : [e]


{- BONUS: a tree pretty printer; the recursive structure of this function
 - is pretty simple, but it is a fiddly function to write if you want it to
 - produce an actually nice tree. -}

{-
layout :: (Show a) => Tree a -> String
layout tree = go "" ("","","") tree
  where
  width = maximum (0:[ length (show e) | e <- elems tree ])
  pad s = let s' = show s in replicate (width-length s') '-' ++ s'
  fill  = replicate width ' '

  --go pre (_,_,preN) Leaf = pre ++ preN ++ "·\n" -- this explicitly draws the leaves
  --go _   _          Leaf = ""                   -- this vertically compresses the tree
  go pre _          Leaf = pre ++ "\n"            -- use more vertical space, but don't draw leaves
  go pre (preR,preL,preN) (Node k lt rt)
    = go (pre ++ preR) (hfill,v_bar,rbend) rt
      ++ (pre ++ preN) ++ pad k ++ junct ++
      go (pre ++ preL) (v_bar,hfill,lbend) lt

  junct = "┤\n"         -- change to "+\n" if no Unicode
  hfill = fill ++ "  "
  rbend = fill ++ "╭─"  -- change to "/-" if no Unicode
  v_bar = fill ++ "│ "  -- change to "| " if no Unicode
  lbend = fill ++ "╰─"  -- change to "\\-" if no Unicode

putTree :: (Show a) => Tree a -> IO()
putTree tree = putStr (layout tree)
-}
