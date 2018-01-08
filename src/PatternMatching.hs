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

myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a > b = GT
    | a == b = EQ
    | otherwise = LT

bmiTellWithWhere :: (RealFloat a) => a -> a -> String
bmiTellWithWhere weight height
    | bmi <= skinny = "skynny"
    | bmi <= normal = "normal"
    | bmi <= fat = "fat"
    | otherwise = "whale"
    where bmi = weight / height ^ 2
          skinny = 18.5
          normal = 25.0
          fat = 30.0
--           (skinny, normal, fat) = (18.5, 25.0, 30.0)

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstname
          (l:_) = lastname

-- Highlight
-- computation with where containing function
-- pattern matching
-- and for comprehension
calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi w h | (w, h) <- xs]
    where bmi weight height = weight / height ^ 2

cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^ 2
    in sideArea + 2 * topArea

withLet :: Integer
withLet = 4 * (let a = 9 in a + 1) + 2

withLet2 :: [(Integer, Integer, Integer)]
withLet2 = [let square x = x * x in (square 5, square 3, square 2)]

withLet3 :: (Integer, String)
withLet3 = (let a = 100; b = 200; c = 300 in a*b*c, let foo="Hey "; bar = "there!" in foo ++ bar)

withLet4 :: Integer
withLet4 = (let (a,b,c) = (1,2,3) in a+b+c) * 100

calcBmis2 :: (RealFloat a) => [(a, a)] -> [a]
calcBmis2 xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]

-- calcBmisForFat :: (RealFloat a) => [(a, a)] -> [a]
calcBmisForFat xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi >= 25.0]