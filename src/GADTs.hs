{-# LANGUAGE GADTs #-}

-- data Maybe a = Nothing | Just a

-- data Maybe a where
--     Just :: a -> Maybe a
--     Nothing :: Maybe a

data Person where
    Person :: { name :: String, age :: Int } -> Person
    deriving Show

main :: IO ()
main = do
    let person1 = Person "John" 25
    print $ name person1
    print $ age person1
