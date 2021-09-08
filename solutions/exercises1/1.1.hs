{-
    i prevented 0 and negative seat numbers
    TODO: for some reason the newlines arent being printed correctly
-}

lyrics :: Integer -> String

lyrics n
    | n < 0 = "negative numbers are not allowed"
    | n == 0 = "no more seats in the lecture hall"
    | otherwise = show n ++ " " ++ seats ++ " in the lecture hall! " ++
        "Only " ++ show n ++ " " ++ seats ++ " left!\n" ++
        "A students walks in, and sits down, now there are\n" ++ lyrics (n-1)
            where seats =   if n /= 1 then "seats"
                            else "seat"

song :: String
song = lyrics (-5)

main = putStr("output of fn \n" ++ song)



