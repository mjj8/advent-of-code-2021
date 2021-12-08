module Main (main) where
import Test.Hspec
import Control.Applicative

import qualified Day01
import qualified Day02
import qualified Day03


spec01 :: Spec
spec01 = do
    describe "day01 parta and partb" $ do
        it "a simple test of parta" $ do
            Day01.parta [0, 1, 0, 1] `shouldBe` 2

        it "the full parta" $ do
            content <- readFile "src/input01.txt"
            let xs = [read x:: Int | x <- lines content]
            Day01.parta xs `shouldBe` 1288

        it "a simple test of triples" $ do
            Day01.triples [0, 1, 2, 3] `shouldBe` [(0,1,2), (1,2,3)]

        it "the full partb" $ do
            content <- readFile "src/input01.txt"
            let xs = [read x:: Int | x <- lines content]
            Day01.partb xs `shouldBe` 1311

spec02 :: Spec
spec02 = do
    describe "day02 tests" $ do
        it "parta capitalize" $ do
            Day02.capitalize "forward 7" `shouldBe` "Forward 7"

        it "parta input helper" $ do
            content <- readFile "src/input02.txt"
            let ss = lines content
            head (Day02.get_inputs (head ss:[]))
                `shouldBe` (read "Forward 7" :: Day02.Input)

        it "full parta" $ do
            content <- readFile "src/input02.txt"
            let us = Day02.get_inputs (lines content)
            let res = Day02.predicta (0, 0) us
            let (x, y) = res
            x * y `shouldBe` 2120749

        it "full partb" $ do
            content <- readFile "src/input02.txt"
            let us = Day02.get_inputs (lines content)
            let res = Day02.predictb (0, 0, 0) us
            let (x, y, _) = res
            x * y `shouldBe` 2138382217

spec03 :: Spec
spec03 = do
    describe "day03" $ do
        it "test count" $ do
            Day03.count '0' "0011" `shouldBe` 2

        it "test transpose" $ do
            Day03.transpose ["000", "111"]
                `shouldBe` ["01", "01", "01"]

        it "test getbits" $ do
            Day03.getbits "011" `shouldBe` [0, 1, 1]

        it "test bin2int" $ do
            Day03.bin2int (Day03.getbits "01001") `shouldBe` 9

        it "test gamma2epsilon" $ do
            Day03.gamma2epsilon "0100" `shouldBe` "1011"

        it "full parta" $ do
            content <- readFile "src/input03.txt"
            let ss = lines content
            let g = Day03.gamma ss
            let e = Day03.gamma2epsilon g
            (Day03.bin2int (Day03.getbits g))
                * (Day03.bin2int (Day03.getbits e))
                    `shouldBe` 3959450


spec :: Spec
spec = do
    describe "day01" spec01
    describe "day02" spec02
    describe "day03" spec03

main :: IO ()
main = hspec spec
-- main = putStrLn ("Test suite is not implemented" :: String)
