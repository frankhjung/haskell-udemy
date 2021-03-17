module Main where

import           Chapter8 (minMax, readInts)

main :: IO ()
main = do
  content <- readFile "test.data"
  let values = readInts content
      count = length values
      total = sum values
      mean = fromIntegral total / fromIntegral count :: Double
      range = minMax values
  putStrLn $ "Count ..:" ++ show count
  putStrLn $ "Total ..:" ++ show total
  putStrLn $ "Mean ...:" ++ show mean
  putStrLn $ "Range ..:" ++ show range
