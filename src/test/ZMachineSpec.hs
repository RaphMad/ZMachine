module Main where

import Data.Bits
import Data.Word
import Test.Hspec
import ZMachine
import ZMachine.ZTypes

word :: Word16
word = 0xBEEF

main :: IO ()
main = hspec $ do

   describe "fetchBits" $ do

      it "works like described in the example" $
         (word `shiftR` 12) .&. complement (-1 `shiftL` 4)
         `shouldBe`
         fetchBits bit15 size4 word
