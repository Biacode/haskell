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
