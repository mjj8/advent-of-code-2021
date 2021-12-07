module Day02 where

import Data.Char

type Meter = Int
type State = (Meter, Meter)
data Input = Forward Meter | Down Meter | Up Meter deriving (Eq, Read, Show)

-- PART A
stepa :: State -> Input -> State
stepa (x, y) u = case u of Forward n -> (x, y + n)
                           Down n -> (x + n, y)
                           Up n -> (x - n, y)


predicta :: State -> [Input] -> State
predicta (x0, y0) us = foldl stepa (x0, y0) us

-- PART B
type Aim = Int
type StateB = (Meter, Meter, Aim)

stepb :: StateB -> Input -> StateB
stepb (x, y, a) u = case u of Forward n -> (x + (a * n), y + n, a)
                              Down n -> (x, y, a + n)
                              Up n -> (x, y, a - n)

predictb :: StateB -> [Input] -> StateB
predictb (x0, y0, a0) us = foldl stepb (x0, y0, a0) us


-- HELPERS
get_inputs :: [String] -> [Input]
get_inputs ss = [read (capitalize s) :: Input | s <- ss]


capitalize :: String -> String
capitalize (x:xs) = toUpper x : xs
