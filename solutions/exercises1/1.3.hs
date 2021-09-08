{-
  expressions:

  e1: 1 + 125 * 8 `div` 10 - 59
      1 + ((125 * 8) `div` 10) - 59
      1 + (1000 `div` 10) - 59
      1 + 100 - 59
      101 - 59
      42

  e2: not True || True && False
      not True || (True && False)
      TODO: ik zie dit als een vergelijking in bv een if statement, maar niet echt wat eruit moet komen. jij wel?

  e3: 1 + 2 == 6 - 3
      3 == 6 - 3
      3 == 3
      True

  e4: "1 + 2" == "6 - 3"
      TODO: ik snap dat dit false is maar niet hoe je dit evalueert

  e5: "1111 + 2222" == "1111" ++ " + " ++ "2222"
      TODO: zelfde
-}