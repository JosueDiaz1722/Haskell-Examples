module QuickCheck where

import Test.QuickCheck

distance :: Int -> Int -> Int
distance x y = abs (y-x)

prop_dist35 :: Bool
prop_dist35 = distance 3 5 == 2

-- The distance between any number and itself is always 0
prop_dist_self :: Int -> Bool
prop_dist_self x = distance x x == 0

-- The distance between x and y is equal to the distance between y and x
prop_dist_symmetric :: Int -> Int -> Bool
prop_dist_symmetric x y = distance x y == distance y x

