module Day02 where

import Data.Char

type Meter = Int
type State = (Meter, Meter)
data Input = Forward Meter | Down Meter | Up Meter deriving (Eq, Read, Show)

step :: State -> Input -> State
step (x, y) u = case u of Forward n -> (x, y + n)
                          Down n -> (x + n, y)
                          Up n -> (x - n, y)


predict :: State -> [Input] -> State
predict (x0, y0) us = foldl step (x0, y0) us


get_inputs :: [String] -> [Input]
get_inputs ss = [read (capitalize s) :: Input | s <- ss]


capitalize :: String -> String
capitalize (x:xs) = toUpper x : xs
