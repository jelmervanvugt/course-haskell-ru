module Char where

import Data.Char

-- 1
(~~) :: String -> String -> Bool
(~~) x y = map toUpper x == map toUpper y

-- 2
reverseCase :: String -> String
reverseCase = map (\x -> if isUpper x then toLower x else toUpper x)

-- 3
shift :: Int -> Char -> Char
shift n x = if not (isAsciiUpper x) then x else shiftChar x
  where shiftChar y = chr ( ord 'A' + (ord y - ord 'A' + n ) `mod` ( 1 + ord 'Z' - ord 'A'))

-- 4
caesar :: Int -> String -> String
caesar x y = map (shift x) z
    where z = map toUpper y

-- 5
msg :: String
msg = "ADMNO D HPNO NKMDIFGZ TJP RDOC AVDMT YPNO"
{- If this is english, the 'D' should either be 'A' or 'I'
 - corresponding with a shift of -3 or +5.
 -
 - (caesar 5 msg) gives something about fairy dust sprinkling.
 -}
