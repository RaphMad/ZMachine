module ZMachine where

import Data.Bits
import ZMachine.ZTypes

fetchBits :: BitNumber -> BitSize -> Number -> Number
fetchBits (BitNumber high) (BitSize length) word =
  let mask = complement $ -1 `shiftL` length
  in word `shiftR` (high - length + 1) .&. mask
