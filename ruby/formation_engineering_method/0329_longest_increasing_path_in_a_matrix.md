```ruby
=begin
m*n integers matrix, return length of longest INCREASING path
Each cell: four directions, NO diagonal or outside boundary

Naive:
flood fill until can no longer travel
(n*m) flood fill operations (up til' n * m)

Memo:
You only need to flood fill once, right?
Once you flood fill on a square, you can reuse that result
bottom-right corner max is 2
middle right max is 1
Once a square goes thru the flood fill operation, that calculation can be
reused every time the square is hit
with caching, hopefully it'll only be m*n
Simplify dfs call so caching can be simple
=end
```
