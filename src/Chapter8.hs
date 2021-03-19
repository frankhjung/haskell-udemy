module Chapter8
    ( readInts
    , minMax
    ) where


readInts :: String -> [Int]
readInts s = map read $ words s

minMax :: Ord a => [a] -> Maybe (a,a)
minMax (h:t) = Just $ foldr (\x (low, high) -> (min x low, max x high)) (h,h) t
minMax _     = Nothing -- no high or low, ie constant
