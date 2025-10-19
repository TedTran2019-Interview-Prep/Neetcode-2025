```ruby
=begin
nums containing n DISTINCT numbers (0, n)
return only number missing in array
Naive: Use a set, add numbers in, check missing after

Math: (1..nums.length) value then subtract nums.sum
Gaussian sum: (n(n + 1)) / 2

Biwise:
XOR: when you xor two of the same, you get 0
Go through 0 to n, xoring those values along with nums
Whatever remaining left is the number that didn't get xor'd twice
=end
```
