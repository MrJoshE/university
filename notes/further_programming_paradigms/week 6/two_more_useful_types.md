### Quicksort Haskell





```haskell
qsort [] = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
							where
								smaller = [a | a <- xs, a <= x]
								larger = [b | b <- xs, b > a]
								

```



##### Things to remember

- Haskell's type system will infer the most generic type