```ruby
# Given two numbers, return an array of integers of length N where the difference between every two consecutive digits is K
# No leading zeroes
# n = 3, k = 7
# 181 292 707 88 929
# All 3 digits (N)
# 181: 18 -> 7, 81 -> 7
# 292: 29 -> 7, 92 -> 7

# Basically start generating a number up to size
# Basically this is a many answers, permutation-type of problem
# Approach:
# Use DFS to generate every possible combination of n-length digits
# If that digit follows the constraint, it's valid
# As you're generating the digit, you can validate as you go

# Plan:
# stack = []
# results = []

# dfs = lambda do
#     if stack.length > 1
#         return if (stack[-1] - stack[-2]).abs != k

#         if stack.length == n
#             results << stack.dup
#             return
#     10.times do |idx|
#         next if stack.empty? && idx.zero?

#         stack << idx
#         dfs.call()
#         stack.pop
# dfs.call
# results
```
