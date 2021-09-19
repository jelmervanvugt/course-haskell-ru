module Char where

import Data.Char
import Distribution.Simple.Utils (xargs)

-- 1
(~~) :: String -> String -> Bool 
(~~) x y = map toUpper x == map toUpper y

-- 2
reverseCase :: String -> String
reverseCase = map (\x -> if isUpper x then toLower x else toUpper x) 

-- 3
shift :: Int -> Char -> Char
shift x y = if isUpper y then (chr.(+x).ord) y else y

-- 4 (testcases do not seem to work yet, but when testing manually is works fine)
caesar :: Int -> String -> String
caesar x y = map (shift x) z
    where z = map toUpper y    


msg :: String
msg = "ADMNO D HPNO NKMDIFGZ TJP RDOC AVDMT YPNO"
