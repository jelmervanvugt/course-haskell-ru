
import Data.List
import Data.Char
import Data.Function
import qualified Data.Map as M

wordFrequency :: String -> [(String,Int)]
wordFrequency  = map (\x->(head x,length x)) . group . sort . words

-- 1
mostFrequentOfLength :: Int -> String -> [(String, Int)]
mostFrequentOfLength i = filter (\x -> snd x >= i) . map (\x -> (head x,length x)) . group . sort . words

-- 2
wordLengthFrequency :: String -> [(Int, Int)]
wordLengthFrequency = sort . map (\x -> (head x, length x)). group . map length . words

-- 3
anagrams :: String -> [[String]]
anagrams = map (map snd) . filter (\x -> length x > 1) . groupBy (\a b -> fst a == fst b) . sort . map (\x -> (sort x, x)) . nub . words 

-- 4
wordFrequency' :: String -> [(String, Int)]
wordFrequency' = M.toList . foldr (\w -> M.insertWith (+) w 1) M.empty . words

{- this 'main' function is only here for the compiled, stand-alone version 
 - calling it from within GHCi is problematic since GHCi itself needs stdin!
 - to compile, run:
 -
 -     ghc -O WordStats 
 -
 - (The -O flag turns on optimizations)
 -}    
main :: IO ()
main = onStdin $ wordFrequency  -- change this to run a different function from the commandline
  where onStdin f = getContents >>= (mapM_ print . f . filter (\x->isAlphaNum x || isSpace x))



