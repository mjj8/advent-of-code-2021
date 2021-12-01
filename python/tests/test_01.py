from unittest import TestCase

from day01.lib import part_a, part_b, triples


class Test01(TestCase):

    def test01a(self) -> None:
        with open("day01/input.txt") as f:
            input = f.read()
            res = part_a(input)
            self.assertEqual(res, 1288)

    def test01b(self) -> None:
        with open("day01/input.txt") as f:
            input = f.read()
            res = part_b(input)
            self.assertEqual(res, 1311)

    def test_triples(self) -> None:
        xs = [1, 2, 3, 4, 5]
        ts = list(triples(xs))
        a0 = (1, 2, 3)
        a1 = (2, 3, 4)
        a2 = (3, 4, 5)
        self.assertEqual(ts[0], a0)
        self.assertEqual(ts[1], a1)
        self.assertEqual(ts[2], a2)
