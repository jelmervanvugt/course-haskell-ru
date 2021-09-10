triangle :: Int -> String
triangle n = draw n 1 1

draw :: Int -> Int -> Int -> String
draw b r a
  | r < b = replicate (fromIntegral (b - r)) ' ' ++ replicate a '*' ++ "\n" ++ draw b (r + 1) (a + 2)
  | otherwise = replicate (fromIntegral (b - r)) ' ' ++ replicate a '*' ++ "\n"

main = putStr(triangle 10)



