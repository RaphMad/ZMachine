module Main where

import Data.Bits
import Test.Hspec
import ZMachine

main :: IO ()
main = hspec $ do

   describe "fetchBits" $ do

      it "works like described in the example" $
         (word `shiftR` 12) .&. complement (-1 `shiftL` 4)
         `shouldBe`
         fetchBits 15 4 word
