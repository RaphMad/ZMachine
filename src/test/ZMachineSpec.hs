module Main where

import Test.Hspec

main :: IO ()
main = hspec $ do

   describe "dummy" $ do

      it "can add" $
         1 + 1 `shouldBe` 2
