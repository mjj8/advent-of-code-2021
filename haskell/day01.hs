
parta :: [Int] -> Int
parta = count_greater

partb :: [Int] -> Int
partb xs = count_greater zs
    where zs = [sum tup | tup <- triples xs]
    
count_greater :: [Int] -> Int
count_greater xs = length [(a, b) | (a, b) <- pairs xs, a < b]

pairs :: [a] -> [(a, a)]
paris xs = zip xs (tail xs)

triples :: [a] -> [(a, a, a)]
triples xs = zip3 xs (tail xs) (tail (tail xs))
