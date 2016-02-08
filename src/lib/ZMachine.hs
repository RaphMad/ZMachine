module ZMachine where

import Data.Bits
import Data.Word

type Number = Word16

doStuff :: IO ()
doStuff = do
   print . show $ (word `shiftR` 12) .&. complement (-1 `shiftL` 4)
   print . show $ fetchBits 15 4 word

word :: Number
word = 0xBEEF

fetchBits :: Int -> Int -> Number -> Number
fetchBits high length word =
  let mask = complement $ -1 `shiftL` length
  in word `shiftR` (high - length + 1) .&. mask
