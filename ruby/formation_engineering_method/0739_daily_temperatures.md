```ruby
# Input: array of integer temps
# output: array of ints, # of days to get a warmer temp
# No future day == 0
# Easiest way to do it: N^2, for each temp, iterate through the entire array looking for a higher temp
# 73 74 75 71 69 72 76 73
# Store temp in stack
# If you get a higher temp, pop off temps until it's empty or the remaining value is greater
# Then add that temp to the stack
# For all temps remaining in the stack at the end, it's 0 (no higher found)
# Inside of the stack, store [temp, index].. then do index2 - index1 to put into the answer

# [73] -> 74
# [74] -> 75
# [75 71 69] -> 72
# [75 72] -> 76
# [76] -> 73
# [76 73]

# Plan:
# stack = []
# days = length of temperature, set to all zeroes

# iterate through temperatures with index, do temp, index
#     until stack is empty or values in stack greater/equal to current temp
#         days[stack[1]] = index - stack[1]
#     add temp, index to stack
# days
```
