{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE ScopedTypeVariables #-}

data USD
data EUR

newtype Amount a = Amount Double 
    deriving (Show, Eq, Ord, Num)

addCurency :: Amount a1 -> Amount a2 -> Double
addCurency (Amount a) (Amount b) = a + b


main :: IO ()
main = do
    let x = addCurency (Amount 5.0 :: Amount EUR) (Amount 3.3 :: Amount EUR)
        y = addCurency (Amount 5.6 :: Amount USD) (Amount 3.6 :: Amount USD)
    putStrLn $ show x ++ " EUR"
    putStrLn $ show x ++ " USD"
