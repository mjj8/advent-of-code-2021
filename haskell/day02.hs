
type Meter = Int
type State = (Meter, Meter)
data Input = Forward Meter | Down Meter | Up Meter

step :: State -> Input -> State
step (x, y) u = case u of Forward n -> (x, y + n)
                             Down n -> (x + n, y)
                               Up n -> (x - n, y)


predict :: State -> [Input] -> State
predict (x0, y0) us = foldr step (x0, y0) us
