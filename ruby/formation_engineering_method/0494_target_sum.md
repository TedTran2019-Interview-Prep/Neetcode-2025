```ruby
=begin
nums, integer target
expression out of nums by adding either "+" and "-"
before each integer in nums then concatenate
return # of different expressions that can be built that hits target

Naive:
At every intersection, can choose + or -
Try every single combination
Can cache maybe?
[index, sum] = # of ways to hit target

Memoized solution is easy to get, but how do I convert memoization to tabulation?

If memoized is:
ways(index, sum) =
ways(index + 1, sum + nums[index]) +
ways(index + 1, sum - nums[index])
Base case is index == nums.length

Tabulation is:
Start from base layer (index 0, sum 0)
and push counts forwards towards next layer
=end
```
