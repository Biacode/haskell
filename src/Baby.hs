module Baby where

doubleMe x = x * 2

doubleBoth x y = doubleMe x + doubleMe y

getHead = head [1, 2, 3, 4]

getTail = tail [1, 2, 3, 4]

getElement elem arr = arr !! elem

doubleIfSmall x = if x > 100 then 100 else doubleMe x

concatArrays x y = x ++ y

checkIfContainsElement element arr = element `elem` arr

rangeOfNumebrs from to = [from..to]

rangeOfAlphabetNumbers from to = [from..to]

numberRangeWithSomeJump = [0.1, 0.3 .. 1]

firstMultipliesOfInfinite num = take num [2, 4..]

listComprehension = [ x | x <- [50..100], x `mod` 7 == 3]

boomBangs li = [if x < 50 then "Boom!!" else "Bang!!" | x <- li, odd x]

multiplePredicateComprehension = [ x | x <- [10..20], x /= 13, x /= 15, x /= 19]

multiListComprehension'decardeanProduct = [x * y | x <- [1..10], y <- [13..22], x * y > 50]