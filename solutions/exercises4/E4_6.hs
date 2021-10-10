module E4_6 where

import Data.Maybe

-- NOTE : add x values and constant integers
data Expr = Lit Integer | Add Expr Expr | Mul Expr Expr | Sub Expr Expr | Div Expr Expr | X
    deriving Show

eval :: (Fractional a) => Expr -> a -> Maybe a
eval (Div a (Lit 0)) x = Nothing
eval (Add a b) x = Just (extractJust (eval a x) + extractJust (eval b x))
eval (Mul a b) x = Just (extractJust (eval a x) * extractJust (eval b x))
eval (Sub a b) x = Just (extractJust (eval a x) - extractJust (eval b x))
eval (Div a b) x = Just (extractJust (eval a x) / extractJust (eval b x))
eval X a = Just a
eval (Lit a) x = Just (fromIntegral a)

extractJust :: Maybe a -> a 
extractJust (Just a) = a


