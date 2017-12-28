module MyZipFunctions where

-- Type variables

fooList = [1 .. 5]
barList = [7 .. 15]

zippedFooBar = zip fooList barList

zipFiniteWithInfinite = zip [1..] ["one", "two", "three"]

triangles = [(a, b, c) | c <- [1..10], b <- [1..c], a <- [1..b], a ^ 2 + b ^ 2 == c ^ 2, a + b + c == 24]

factorial :: Integer -> Integer
factorial n = product [1..n]

third :: (a, b, c) -> c
third (_, _, c) = c

-- Classes

-- Eq
-- :t (==)
-- (==) :: (Eq a) => a -> a -> Bool

--
-- Ord
-- :t (>)
-- (>) :: (Ord a) => a -> a -> Bool
cmp1 = "Abrakadabra" < "Zebra"
-- True
cmp2 = "Abrakadabra" `compare` "Zebra"
-- LT
cmp3 = 5 >= 2
-- True
cmp4 = 5 `compare` 3
-- GT

-- Show
-- ghci> show 3
-- "3"
-- ghci> show 5.334
-- "5.334"
-- ghci> show True
-- "True"

-- Read
-- ghci> read "True" || False
-- True
-- ghci> read "8.2" + 3.8
-- 12.0
-- ghci> read "5" - 2
-- 3
-- ghci> read "[1,2,3,4]" ++ [3]
-- [1,2,3,4,3]
-- Explicit
-- ghci> read "5" :: Int
-- 5
-- ghci> read "5" :: Float
-- 5.0
-- ghci> (read "5" :: Float) * 4
-- 20.0
-- ghci> read "[1,2,3,4]" :: [Int]
-- [1,2,3,4]
-- ghci> read "(3, 'a')" :: (Int, Char)
-- (3, 'a')

-- Enum
-- ghci> ['a'..'e']
-- "abcde"
-- ghci> [LT .. GT]
-- [LT,EQ,GT]
-- ghci> [3 .. 5]
-- [3,4,5]
-- ghci> succ 'B'
-- 'C'

-- Bounded
-- ghci> minBound :: Int
-- -2147483648
-- ghci> maxBound :: Char
-- '\1114111'
-- ghci> maxBound :: Bool
-- True
-- ghci> minBound :: Bool
-- False
-- ghci> maxBound :: (Bool, Int, Char)
-- (True,2147483647,'\1114111')

-- Num
-- ghci> :t 20
-- 20 :: (Num t) => t
-- ghci> 20 :: Int
-- 20
-- ghci> 20 :: Integer
-- 20
-- ghci> 20 :: Float
-- 20.0
-- ghci> 20 :: Double
-- 20.0
-- ghci> :t (*)
-- ghci> (5 :: Int) * (6 :: Integer) --------- error