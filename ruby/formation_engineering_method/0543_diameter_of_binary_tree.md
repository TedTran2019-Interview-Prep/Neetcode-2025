```ruby
# Given root, return length of diameter
# Longest path between any two nodes (may or may not pass through root)
# Isn't the diameter just how far the tree goes left/right?
# Find the "right most" and "left most" then add them together? - Wouldn't work
# Let's just find out the longest diameter instead
# From each node, add the longest left + longest right children together and compare with max
# Return the highest of longest left or longest right
# single node returns 0 for diameter!

# Plan:
# diameter_max
# dfs lambda
#     return 0 if node is nil

#     left = dfs.call left
#     right =  dfs.call right

#     compare max w/ left + right  + 1
#     return max of left, right + 1

# call dfs
# return diameter_max
```
