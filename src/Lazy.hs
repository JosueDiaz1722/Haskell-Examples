import Control.DeepSeq

data RunningTotal = RunningTotal
  { sum :: Int
  , count :: Int
  }
instance NFData RunningTotal where
  rnf (RunningTotal sum count) = sum `deepseq` count `deepseq` ()

printAverage :: RunningTotal -> IO ()
printAverage (RunningTotal sum count)
  | count == 0 = error "Need at least one value!"
  | otherwise = print (fromIntegral sum / fromIntegral count :: Double)

printListAverage :: [Int] -> IO ()
printListAverage =
  go (RunningTotal 0 0)
  where
    go rt [] = printAverage rt
    go (RunningTotal sum count) (x:xs) =
      let rt = RunningTotal (sum + x) (count + 1)
       in rt `deepseq` go rt xs

main :: IO ()
main = printListAverage [1..100]