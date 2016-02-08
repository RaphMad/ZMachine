module Main where

import Data.Bits
import Data.Word
import ZMachine
import ZMachine.ZTypes

word :: Word16
word = 0xBEEF

main :: IO ()
main = do
   print . show $ (word `shiftR` 12) .&. complement (-1 `shiftL` 4)
   print . show $ fetchBits bit15 size4 word
