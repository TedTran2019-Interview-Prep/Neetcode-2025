```ruby
# input: nums
# output: nums[i] equal to product of all eles of nums expect itself

# 1 2 3 4
# 2 * 3 * 4 = 24
# 1 * 3 * 4 = 12
# 1 * 2 * 4 = 8
# 1 * 2 * 3 = 6
# Obvious solution that's N^2, just go through every other element for every element.
# Has to run in O(N) time and is guaranteed to fit within a 32 bit integer.

# What's the pattern here?
# Maybe a pre-compute line?
# 1 2 3 4
# 1 2 6 24

# Wait, just get the total value (1 * 2 * 3 * 4 = 24) then divide by the value of itself
# 24 / 1, 24 / 2, 24 / 3, 24/ 4
# When does this run into a problem? When there's a zero

# Maybe precompute all elements to the left running value
# Then compute all elements to the right running value
# For example at 2, it's 1 * 3 * 4
# So at 2, the value to the right would be 12
# The value to the left would be 1
# For 3, the value to the right would be 4
# The value to the left would be 1 * 2 = 2, that'd equal 8
# So [1, 2, 3, 4]
# Would make left: 1, 2, 6, 24
# Would make the right: 24  24  12  4,
# Then 1 would be 1 * 24
# 2 would be 1 * 12
# 3 would be 2 * 4
# 4 would be 12 * 1

# Is there a way to do this within the same array? E.g, using only the output array
# Can make the right
# Then just iterate through the left, keeping a running tally
# Then left is just 1 * right, replacing the first element in the output array every time

# Plan:
# create output = []
# iterate from nums.reverse
#     do the mult, add elements to output
# reverse output
# left = 1
# iterate from nums, each num
#     do output[i] = left tally * output[i + 1]
#     output[i + 1] is nil, means it equals to 1
# return output
```
