```ruby
=begin
nums, integer k
maximum sum of a subarray that's divisible by k
Naive: generate every possible subarray, if size is divisible by k, check against max
[-5, 1, 2, -3, 4], k = 2
By LENGTH, not by INDEX
0 [-5, -4, -2, -5, -1]: prefix sums
0       2       4
    1       3      5
At index 2, best sum is -4
At index 4, best is -5 - - 4 = 1. (-5 - 0 = -5 which is worse), so you want to keep track of the
minimum prefix sum
At index 3, best is (-2 - -5) = 3
At index 5, best is (-1 - -5) = 4
Remember it has to be the minimum prefix sum at least (K - 1) away.
Up until xyz index, what is the minimum prefix sum?
=end
```
