type Assoc k v = [(k,v)]

-- define the type for find
find::Eq k => k -> Assoc k v -> v
find k t = head [v | (k',v) <- t, k==k']



