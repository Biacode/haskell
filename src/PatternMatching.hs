module PatternMatching where

lucky :: (Integral a) => a -> String
lucky 7 = "You are lucky!!!"
lucky _ = "You are not lucky"

sayMe :: (Integral a) => a -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5"

simpleFactorialWithoutPatternMatching :: (Integral a) => a -> a
simpleFactorialWithoutPatternMatching n = product [1..n]

factorialWithPatternMatching :: (Integral a) => a -> a
factorialWithPatternMatching 0 = 1
factorialWithPatternMatching n = n * factorialWithPatternMatching (n - 1)

charName :: Char -> String
charName 'a' = "Albert"
charName 'b' = "Broseph"
charName 'c' = "Cecil"

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z

-- Pattern matching in list comprehensions
xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]

matchInXs :: [Integer]
matchInXs = [a + b | (a, b) <- xs]

head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x

tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y

lengthWithoutPatternMatching xs = sum [1 | _ <- xs ]

lengthWithPatternMatching :: (Integral b) => [a] -> b
lengthWithPatternMatching theList = lengthWithPatternMatchingAndAccumulator theList 0

lengthWithPatternMatchingAndAccumulator :: (Integral b) =>  [a] -> b -> b
lengthWithPatternMatchingAndAccumulator [] acc = acc
lengthWithPatternMatchingAndAccumulator (_:xs) acc = lengthWithPatternMatchingAndAccumulator xs (acc + 1)

sumWithPatternMatching :: Num t => [t] -> t
sumWithPatternMatching theList = sumWithPatternMatchingAndAcc theList 0

-- There is a thing called `patterns` all@(head:tail)
sumWithPatternMatchingAndAcc :: Num t => [t] -> t -> t
sumWithPatternMatchingAndAcc [] acc = acc
sumWithPatternMatchingAndAcc all@(head:tail) acc = sumWithPatternMatchingAndAcc tail (head + acc)

capital :: String -> String
capital "" = "Empty string, whoops!"
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"
    | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
    | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise                   = "You're a whale, congratulations!"

max' :: Ord a => a -> a -> a
max' a b
    | a > b     = a
    | otherwise = b

max' :: Ord a => a -> a -> a
max' a b | a > b = a | otherwise = b

myComparer :: (Ord a) => a -> a -> Ord
a `myComparer` b
    | a > b = GT
    | a == b = EQ
    | otherwise = LT