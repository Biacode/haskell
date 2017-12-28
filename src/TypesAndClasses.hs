module TypesAndClasses where

removeNonUpperCase :: String -> String
removeNonUpperCase st = [c | c <- st, c `elem` ['A'..'Z'] ]

addThreeIntegers :: Int -> Int -> Int -> Int
addThreeIntegers x y z = x + y + z