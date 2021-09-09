{-

  double x = incr (incr 0)
    where incr y = x + y

  ------------------------

  double 5 = incr (incr 0)
      where incr y = 5 + y

    = incr (5 + 0))
      where incr y = 5 + y
    = (5 + (5 + 0))
    = (5 + 5)
    = 10

-}