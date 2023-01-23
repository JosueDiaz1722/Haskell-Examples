module QuickCheckSpec where

import Test.Hspec
import Test.Hspec.QuickCheck

import QuickCheck

spec :: Spec
spec = do
  describe "myQuickCheck" $ do
    prop "QuickCheck distance function" $ \a b ->
        distance a b `shouldBe` abs (a-b)