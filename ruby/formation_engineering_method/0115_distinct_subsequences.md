```ruby
=begin
Given s/t, return # o distinct subsequences of s which equal t
subsequence = order maintained
babgbag, bag
ba--g---
ba----g
b-----ag
--b--ag
----bag

Naive:
generate every possible subsequence of s, increment count when it equals t

Better?:
since ordering matters, you really only need to start generating on a match
[b], [b]
then you deal with [abgbag] and [ag] subproblems
Go through s, t (indexes)
If match, +1 +1 OR skip like it's a not match (this is where the branch occurs)
If not match, +1, 0
If you reach out of bounds for t, that's 1
If reach out of bounds for s without the above condition, 0
=end
```
