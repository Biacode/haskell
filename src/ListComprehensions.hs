module ListComprehensions where

listComprehension = [ x | x <- [50..100], x `mod` 7 == 3]

boomBangs li = [if x < 50 then "Boom!!" else "Bang!!" | x <- li, odd x]

multiplePredicateComprehension = [ x | x <- [10..20], x /= 13, x /= 15, x /= 19]

multiListComprehension'decardeanProduct = [x * y | x <- [1..10], y <- [13..22], x * y > 50]

adjectives = ["lazy","grouchy","scheming"]
nouns = ["hobo","frog","pope"]
foos = ["foo", "bar", "baz"]

combinationOfNounsAndAdjectives = [[adjective, noun, foo] | adjective <- adjectives, noun <- nouns, foo <- foos]

length' xs = sum [1 | _ <- xs]

removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]

xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]

removeOddsWithoutFlatten = [[x | x <- xs, even x] | xs <- xxs]