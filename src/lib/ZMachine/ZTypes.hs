{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module ZMachine.ZTypes where

import Control.Applicative
import qualified Data.Map as M
import Data.Word

type Number = Word16

data BitNumber = BitNumber Int
bit0 = BitNumber 0
bit1 = BitNumber 1
bit2 = BitNumber 2
bit3 = BitNumber 3
bit4 = BitNumber 4
bit5 = BitNumber 5
bit6 = BitNumber 6
bit7 = BitNumber 7
bit8 = BitNumber 8
bit9 = BitNumber 9
bit10 = BitNumber 10
bit11 = BitNumber 11
bit12 = BitNumber 12
bit13 = BitNumber 13
bit14 = BitNumber 14
bit15 = BitNumber 15

data BitSize = BitSize Int
size1 = BitSize 1
size2 = BitSize 2
size3 = BitSize 3
size4 = BitSize 4
size5 = BitSize 5
size6 = BitSize 6
size7 = BitSize 7

data ByteAddress = ByteAddress Int

isInRange :: ByteAddress -> Int -> Bool
isInRange (ByteAddress address) size = 0 <= address && address < size

isOutOfRange :: ByteAddress -> Int -> Bool
isOutOfRange address size = not $ isInRange address size

type IntMap = M.Map Int

data ImmutableBytes = ImmutableBytes { originalBytes :: [Word8], edits :: IntMap Word8 }

make :: [Word8] -> ImmutableBytes
make bytes = ImmutableBytes bytes M.empty

size :: ImmutableBytes -> Int
size = length . originalBytes

readByte :: ImmutableBytes -> ByteAddress -> Maybe Word8
readByte bytes address@(ByteAddress addr) =
   if isOutOfRange address (size bytes)
   then Nothing
   else M.lookup addr (edits bytes) <|>
        Just (originalBytes bytes !! addr)

writeByte :: ImmutableBytes -> ByteAddress -> Word8 -> Maybe ImmutableBytes
writeByte bytes address@(ByteAddress addr) value =
   if isOutOfRange address (size bytes)
   then Nothing
   else Just $ ImmutableBytes (originalBytes bytes) (M.insert addr value (edits bytes))

newEdits :: ImmutableBytes -> IntMap Word8 -> ImmutableBytes
newEdits (ImmutableBytes b _) = ImmutableBytes b
