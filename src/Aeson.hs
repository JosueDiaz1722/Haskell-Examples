{-# LANGUAGE DeriveGeneric #-}

module Aeson
  ( aesonExample,
    decodingExample,
  )
where

import Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as BS
import qualified Data.Map as M
import GHC.Generics

data Programmer = Programmer
  { salaries :: M.Map String Double,
    name :: String,
    position :: String
  }
  deriving (Generic, Show)

instance ToJSON Programmer

instance FromJSON Programmer

aesonExample :: IO ()
aesonExample = do
  let exampleSalaries = M.singleton "Quincena" 600.80
  let exampleProgrammer = Programmer exampleSalaries "Juan" "Tier 1"
  let example = encode exampleProgrammer
  BS.putStrLn example

decodingExample :: IO (Maybe Programmer)
decodingExample = do
  exampleData <- BS.readFile "programmers.json"
  return (decode exampleData)
