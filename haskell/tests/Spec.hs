module Main (main) where
import Test.Hspec

import qualified Day01


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

spec :: Spec
spec = do
    describe "day01" spec01

main :: IO ()
main = hspec spec
-- main = putStrLn ("Test suite is not implemented" :: String)
