module Main where

  import List

  {-grid = [(0, 0), (0, -1), (-1, 0), (-1, -1), (-2, -1), (1, 0)]-}
  grid = [(0, 0), (-1,0), (1,0)]

  neighbours :: (Integer, Integer) -> [(Integer, Integer)]
  neighbours (x,y) = List.delete (x,y) [ (a+x, b+y) | a <- [-1..1], b <- [-1..1] ]

  neighbourCount :: (Integer, Integer) -> Int
  neighbourCount (x,y) = List.length [ (a,b) | (a,b) <- neighbours(x,y), (a,b) `elem` grid ]

  comesAlive :: (Integer, Integer) -> Bool
  comesAlive (x,y)
    | isAlive(x,y) && neighbourCount(x,y) `elem` [2, 3] = True
    | isAlive(x,y) && neighbourCount(x,y) > 3 = False
    | isAlive(x,y) && neighbourCount(x,y) < 2 = False
    | isDead(x,y) && neighbourCount(x,y) == 3 = True
    | otherwise = False


  isAlive :: (Integer, Integer) -> Bool
  isAlive (x,y) = (x,y) `elem` grid

  isDead :: (Integer, Integer) -> Bool
  isDead (x,y) = not( isAlive(x,y) )

  tick :: [(Integer, Integer)] -> [(Integer, Integer)]
  tick [] = error "no live cells"
  tick [x] = []
  tick (x:xs) = nub( [(a,b) | (a,b) <- neighbours(x), comesAlive(a,b)] ++ tick(xs) )

  {-tick grid == [(0,0), (0,-1), (0,1)] -}
