{-# LANGUAGE OverloadedStrings #-}

module Cassava (main) where

import qualified Data.ByteString.Lazy as BL
import Data.Csv
import qualified Data.Vector as V

data Inventory = Inventory
    {
        description :: String,
        quantity :: Int
    }
    deriving (Show)

instance FromNamedRecord Inventory where
    parseNamedRecord r = Inventory <$> r .: "description" <*> r .: "quantity"


main :: IO ()
main = do
    csvData <- BL.readFile "inventory.csv"
    case decodeByName csvData of
        Left err -> putStrLn err
        Right (_, v) -> V.forM_ v $ \ p ->
            putStrLn $ description p ++ " we have " ++ show (quantity p)