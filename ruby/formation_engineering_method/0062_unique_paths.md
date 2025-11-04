```ruby
=begin
=begin
Robot on mxn grid
Located at top-left corner [0, 0]
Tries to move to bottom-right
Can only move down OR right at any point in time
Given m/n, return possible unique paths robot can take to reach bottom right

Recursive problem.. how many possible ways to reach xyz square
Naive:
Recursively go right -> down
Every time you hit finish, += 1
Model down as +1 in y just to keep things simple

How do I cache or use DP to solve this?
For DP:
For first row, there's only 1 way to reach each point, let's say x
For second row, it's:
1 for first (only down, let's say y)
2 for second (right down, down right)
3 for third (right right down, right down right, down right right)
...
pattern: how many does it take to reach left + top added together
If out of bounds: 0
Can just calculate left to right ->
1 1 1
1 2 3
1 3 6

Can make it more space efficient by only using a single row and replacing values in
that row after using them!
=end
```
