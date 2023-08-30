{-# LANGUAGE RankNTypes #-}

rankN :: (forall n. Num n => n -> n) -> (Int, Double)
rankN f = (f 1, f 1.0)

rankN2 :: (forall a. Show a => (a -> String)) -> String -> Int -> IO ()
rankN2 show' string int = do
   putStrLn (show' string)
   putStrLn (show' int)

main :: IO ()
main = do
    rankN2 show "test" 2
    print $ rankN (+1)
