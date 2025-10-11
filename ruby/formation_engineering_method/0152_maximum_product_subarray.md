```ruby
=begin
Find subarray with largest product, return it
Any subarray with 0 becomes 0
Any subarray with odd negatives becomes negative
If a zero subarray is hit, start over (1, 1)
max, min = 1, 1
[2, 3, -2, 4] (Choices are max * n, min * n, or n)
(min, max)
2, 2
3, 6
-12, -2
-48, 4
Best: 6
At any given point, finding min/max so far
To solve the larger array, need to solve all subproblems (...size 3, size 2, size 1)
=end
```
