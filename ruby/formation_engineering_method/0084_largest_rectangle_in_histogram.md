```ruby
# Given: heights representing histogram's bar height, width of each bar is 1
# Largest rectangle in histogram
# Need an O(N) solution
# Area: width (index - index) * minimum element in "window"
# As you traverse the array...
# If you go higher to lower: all elements forward from that point are limited by the next's height
# If lower to greater/same: "Limit" remains the same current element
# Using a stack... when are elements calculated?
# 2 1 3 5 6 4
# For 2, only need to calculate itself (left is empty)
# For 1, it needs to calculate left and right...
# For 3, it needs to calculate itself and to the right
# For 5, it eneds to calculate itself and to the right
# For 6, it needs to calculate itself and to the right
# For 4, it needs to calculate to the left (right is empty)

# Think about the decreasing/same case: what happens? It needs to know an index of elements same/larger than it (to the left) and index same/larger to the right
# Stack storing [index, value]: 2 1 3 5 6 4
# 0, 2
# Sees a 1, which is less/equal... so pop and do calculations on that 2
# Add in 1 to the stack, takes in index of the popped value (it's greater than it confirmed)
# Takes in 3, 5, 6: all greater values, can calculate itself here (but don't have right values yet to use)
# Takes in 4: Pops off 5/6
# - all values to the right of 6 are smaller than it (confirmed by stack)
# - depending on how many elements popped in stack, that's hwo many elements are greater than 5, which determines width of 5
# 1 3 4 remaining in stack:
# - 4 is popped: right is empty, everything left is smaller,
# - 3 is popped, left is smaller, use index, go all the way to popped element
# - 1 is popped: index of 1 is where 2 was so it's 0, go to first popped element?
# It's essentially cleverly using a stack to denote downward/upward limitations, in a way.
# If you go downwards, it's less, and you can take the index of the value you popped
# Highest value popped in one cycle determines the 'start index' to minus the current index by
# For the replacing element, it takes on the index of the last element popped (cuz it's less than, meaning it can extend that way)
# Think about how the histograms can extend left or right depending on their heights.
# If it reaches the end, that means it extends all the way from its index to the end of the histogram...

# Simplifying all these rules into a plan:
# create a stack
# max_area = 0
# iterate through heights with index, height index
#     if height is greater than last element in stack || stack is empty
#         add [height, index] to stack
#     else
#         until stack is empty OR current height is greater than top of stack
#             area = pop from stack, index - element's index * element's height
#             compare with max area
#             on the final stack pop, save the index to use for curr element's index
# iterate through remaining elements in stack, do height index
#     do heights.length - index * height and compare with max area
# max_area
```

```ruby
# Array of integer heights, width of each bar is 1
# area of largest rectangle in histogram
# What is a rectangle? Continuous 2W, 2H
# 2 1 5 6 2 3
# 2 1, forms a rectangle of width 2, height 1
# 2 1 5 forms a rectangle of width 3, height 1
# 5 6 forms a rectangle of width 2, height 5
# Height of the rectangle is the MINIMUM height of all bars used in the rectangle
# The width is simply how many rectangles are used
# Going smaller = making the size smaller, unless you can get rid of a smaller height bar
# Can't use 2 pointer approach unless you know size of minimum unit at all times
# Pretend: inefficient approach where you just use .min every time
# 2 1 5 6 2 3
# L         R = 6
#   L       R = 5
#     L.    R = 8
#     L   R = 6
#     L R   = 10
# How does one know the minimum of the window at any given time?

# Honestly even with the 2 pointer approach-- will it only discard useless values? That's not true-- two pointer approach won't work. Take something like
# 4 2 0 3 2 4 3 4
# L             R
# Right goes <-- all the way, doesn't achieve correct answer
```
