from typing import Tuple
from enum import Enum

Meter = int
State = Tuple[Meter, Meter]

class Direction(Enum):
  Forward
  Down
  Up
  
Input = Tuple[Direction, Meter]


def step(q: State, u: Input) -> State:
  (x, y), (d, n) = q, u
  if d == Forward:
    q = (x, y + n)
  elif d == Down:
    q = (x + n, y)
  elif d == Up:
    q = (x - n, y)
  else:
    raise ValueError
  return q


def predict(q0: State, us: List[Input]) -> State:
  q = q0
  for u in us:
     q = step(q, u)
  return q
