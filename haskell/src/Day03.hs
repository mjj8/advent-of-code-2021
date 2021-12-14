module Day03 where

import Control.Applicative
import Data.List (sort)
import Data.Char (digitToInt)

-- PART A

gamma :: [[Char]] -> [Char]
gamma xs = map (snd . last) 
    [sort [(count v ys, v) | v <- ['0', '1']] 
        | ys <- transpose xs]

epsilon :: [[Char]] -> [Char]
epsilon = gamma2epsilon . gamma

gamma2epsilon :: [Char] -> [Char]
gamma2epsilon = map myflip 

-- PART B

oxrating :: Int -> [[Char]] -> [Char]
oxrating n [x] = x
oxrating n xs = oxrating (n + 1) ys
    where
        ys = [x | x <- xs, x !! n == v !! n]
        v = gamma xs

c02rating :: Int -> [[Char]] -> [Char]
c02rating n [x] = x
c02rating n xs = c02rating (n + 1) ys
    where
        ys = [x | x <- xs, x !! n == v !! n]
        v = epsilon xs


-- HELPERS
count :: Eq a => a -> [a] -> Int
count x = length . filter (== x)

transpose :: [[a]] -> [[a]]
transpose xs = (map getZipList . getZipList . traverse ZipList) (ZipList xs)

type Bit = Int

bin2int :: [Bit] -> Int
bin2int bits = sum [w * b | (w, b) <- zip weights (reverse bits)]
               where weights = iterate (*2) 1

getbits :: [Char] -> [Bit]
getbits = map digitToInt

myflip :: Char -> Char
myflip '0' = '1'
myflip '1' = '0'
