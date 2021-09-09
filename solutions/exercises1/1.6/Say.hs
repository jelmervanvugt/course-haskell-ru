module Say where

{-
  doesnt support numbers higher than 999.999
-}

say :: Integer -> String

-- needed values for function
say 0 = "zero"
say 1 = "one"
say 2 = "two"
say 3 = "three"
say 4 = "four"
say 5 = "five"
say 6 = "six"
say 7 = "seven"
say 8 = "eight"
say 9 = "nine"
say 10 = "ten"
say 11 = "eleven"
say 12 = "twelve"
say 13 = "thirteen"
say 15 = "fifteen"
say 18 = "eighteen"
say 20 = "twenty"
say 30 = "thirty"
say 40 = "forty"
say 50 = "fifty"
say 60 = "sixty"
say 70 = "seventy"
say 80 = "eighty"
say 90 = "ninety"
say 100 = "hundred"
say 1000 = "thousand"

-- splits integer in integer list and passes it to printNumber
say n = printNumber (splitInteger n)

splitInteger :: Integer -> [Integer]
splitInteger = map (read . (:[])) . show

-- recursive function which loops through integer list and expresses number in natural language
printNumber :: [Integer] -> String
printNumber n
  | length n > 3  = printNumber (fst (splitAt (length n - 3) n)) ++ " thousand " ++ printNumber (snd (splitAt (length n - 3) n)) ++ " "
  | length n == 3 = printNumber (fst (splitAt (length n - 2) n)) ++ " hundred " ++ printNumber (snd (splitAt (length n - 2) n)) ++ " "
  | length n == 2 = say (n !! 0 * 10) ++ " " ++ say (n !! 1)
  | length n == 1 = say (n !! 0)
  | otherwise     = error "Parser only supports numbers up until 999.999"

main = say 999999


