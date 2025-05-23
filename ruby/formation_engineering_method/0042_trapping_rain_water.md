```ruby
# n non-negative representing an elevation map
# width of each bar is 1 (does this matter?)
# How much water can it trap after raining
# Amount of water that can be trapped is [L,R heights].min - current height
# Problem: Flooded structures, e.g there's a greater to the left or right and everything is flooded until that point...
# [0 1 0 2 1 0 1 3 2 1 2 1]
# [0 1 1 2 2 2 2 3 3 3 3 3] <- Greatest height from left
# [3 3 3 3 3 3 3 3 2 2 2 1] <- Greatest height from right
#  0 0 1 0 1 2 1 0 0 1 0 0 = 6
# Minimum of L/R - current

# Plan:
# create the left max
# create the right max
# water = 0
# iterate through height with index, for each h, idx
#     add left_max[idx], right_max[idx]'s min - h to water
# water
```

```ruby
# Continuation: How would you do this in constant space?
# Left can be handled with a single variable, a tally
# Right can also be handled with a single variable
# At any given point, only left OR right are needed (the minimum)
# Given: [0,1,0,2,1,0,1,3,2,1,2,1]
# left pointer = 0
# right pointer = array.length - 1
# left_max = value at left pointer
# right_max = value at right pointer
# Is left or right the minimum?
# If left is the minimum:
# calculate water where left is, left
# For example:
# left: 0 -> 1 -> 0
# right: 1
# Since leftmax is 1, 1 - 0 = +1 to water
# THEN
# left: -> 2
# right: 1 -> 2 -> 1 -> 2 -> 3
# right max is 2, 2 - 1 at some point == 1
# THEN
# left: 1 -> 0 -> 1 -> (3, hits same value as right and breaks)
# right: 3
# BUT, max on left is 2, 2 -1, 2 -0, 2 - 1 that is 4 water
# Combined with the 1 water from left and 1 from right, that's 6 water!
```
