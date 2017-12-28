module MyZipFunctions where

fooList = [1 .. 5]
barList = [7 .. 15]

zippedFooBar = zip fooList barList

zipFiniteWithInfinite = zip [1..] ["one", "two", "three"]

triangles = [(a, b, c) | c <- [1..10], b <- [1..c], a <- [1..b], a ^ 2 + b ^ 2 == c ^ 2, a + b + c == 24]