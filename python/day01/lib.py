from typing import Iterator, Iterable, Any, Tuple, List
from itertools import tee


def part_a(input: str) -> int:
    xs = [int(x) for x in input.split('\n') if x]
    return count_growth(xs)


def part_b(input: str) -> int:
    xs = [int(x) for x in input.split('\n') if x]
    ts = triples(xs)
    zs = [sum(tup) for tup in ts]
    return count_growth(zs)


def count_growth(xs: List[int]) -> int:
    pairs = pairwise(xs)
    count = 0
    for a, b in pairs:
        if b > a:
            count += 1
    return count


def pairwise(xs: Iterable) -> Iterator[Tuple[Any, Any]]:
    "xs -> (x0,x1), (x1,x2), (x2, x3), ..."
    ys, zs = tee(xs)
    next(zs, None)
    return zip(ys, zs)


def triples(xs: Iterable) -> Iterator[Tuple[Any, Any, Any]]:
    "xx -> (x0,x1,x2), (x1,x2,x3), (x2, x3, x4), ..."
    ps, qs, rs = tee(xs, 3)
    next(qs, None)
    next(rs, None)
    next(rs, None)
    return zip(ps, qs, rs)
