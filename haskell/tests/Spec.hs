module Main (main) where

{-| someFunc 
>>> someFunc
-}


{-| triple 
>>> triple ""
""
>>> triple "a"
"aaa"
-}

triple :: [a] -> [a]
triple l = l ++ l ++ l

main :: IO ()
main = putStrLn ("Test suite is not implemented" :: String)