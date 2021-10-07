module FDOT1 where

data Day       = Mon | Tue | Wed | Thu | Fri | Sat | Sun
  deriving Show
{-
    show Mon
    show Tue
    Wed
-}


data Prop      = Prop :-> Prop | T | F
  deriving Show
{-
    show T 
    T
    F
-}  

data Unit      = Unit
  deriving Show
{-
    show Unit
    Unit 
-}  

data Foo a     = Bar a
  deriving Show
{-
    Bar 1
    Bar "this is a string"
    Bar False
-}  

data Tuple a b = Two a b | One a | None
  deriving Show
{-
    Two 1 2
    Two (One 1) (Two 1 2)
    None
-}

data Wrapped a = Wrapped (Wrapped a) | Bare a
  deriving Show
{-
    Wrapped (Wrapped (Bare 1))
    Bare "i am a string"
    Wrapped (Bare True)
-}


