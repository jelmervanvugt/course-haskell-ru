module Obfuscate where

import Data.Text as T
import Data.List as L
import Data.Char as C
import Prelude as P

cambridge :: String -> String 
cambridge s =  L.intercalate " " ( P.map applyShuffle ( P.concat ( P.map splitControl (P.words s) ) ) )

applyShuffle :: [Char] -> String 
applyShuffle s 
  | l == 1 = s
  | otherwise = heads ++ shuffle rest ++ tails
       where heads = P.take 1 s
             tails = P.take 1 (P.reverse s)
             rest  = P.reverse (P.take ((P.length s) - 2) (P.reverse (P.take ((P.length s) - 1) s)))
             l = P.length s

splitControl :: String -> [String] 
splitControl [] = []
splitControl xs = if isControlChar lastChar then rest : [[lastChar]] else [xs]
       where splitted = P.splitAt ((P.length xs) - 1) xs
             rest = fst splitted 
             lastChar = P.head (snd splitted)            

-- NOTE : I tailored this function to the meme input text. Some controlChars have been left out.
isControlChar :: Char -> Bool
isControlChar c 
 | c == ',' = True
 | c == '.' = True
 | c == '!' = True
 | c == '?' = True
 | c == ':' = True
 | c == '\'' = True
 | otherwise = False

shuffle :: [a] -> [a]
shuffle [] = []
shuffle xs
  | l == 1 = xs
  | l == 2 = [xs !! 1, xs !! 0]
  | otherwise = [xs !! 1, xs !! 0] ++ shuffle (snd (P.splitAt 2 xs))
  where l = P.length xs     

test :: [a] -> Int 
test (x:xs:xss) = P.length ([x:xs:xss])

meme :: String
meme = "According to research at Cambridge university, it doesn't matter\
       \ what order the letters in a word are, the only important thing is\
       \ that the first and last letters are at the right place. The rest can\
       \ be a total mess and you can still read it without a problem. This is\
       \ because we do not read every letter by it self but the word as a wohle."

main :: IO()
main = putStr ( show (cambridge meme) )