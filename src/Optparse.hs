{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators     #-}

module Optparse (createProgrammer, main) where

import Options.Generic

data Programmer = Programmer
  { name :: String <?> "Name of the Programmer",
    tier :: String <?> "Tier of the Programmer",
    salary :: Double <?> "Salary of the Programmer"
  }
  deriving (Generic, Show)

instance ParseRecord Programmer

createProgrammer :: String -> String -> Double -> IO ()
createProgrammer name tier salary =
  putStrLn $
    "Programmer Name: "
      ++ name
      ++ " Tier: "
      ++ tier
      ++ " Salary: "
      ++ show salary
      ++ " USD "

main :: IO ()
main =
  do
    x <- getRecord "Programmer createProgrammer"
    print (x :: Programmer)