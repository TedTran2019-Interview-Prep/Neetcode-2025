```ruby
# 1 indexed numbers, sorted in non-decreasing (same/greater for each?)
# Two numbers that add up to a specific target
# Exactly one solution, no same elements twice
# CONSTANT SPACE
# Return index1 + 1, index2 + 1

# 2 7 11 15, target = 9
# [1, 2]
# L, R
# 2 15, target = 9
# <-- to go less
# --> to go more
# 2     15 = 17
# 2 11 = 13
# 2 7 = 9

# 2 3 4 = 6
# 2 4 = 6

# -1 0

# Plan:
# left pointer = 0
# right pointer = array.length - 1
# while left < right
#     if left + right == target,
#         return [left + 1, right + 1]
#     elsif left + right > target
#         right--
#     else
#         left++
# 'Shouldn't have hit this point ever lol'
```
