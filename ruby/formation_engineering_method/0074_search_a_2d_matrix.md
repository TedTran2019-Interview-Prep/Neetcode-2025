```ruby
# In hindsight, there are two cleaner solutions
# 1. I thought of this but decided against this approach, was using index math to consider the matrix as a 1D array for binary search.
# 2. Neetcode's binary search for the row was a lot cleaner.
#    - Checked if target > matrix[row][-1] (max of that row)
#        - If it's greater, only check all subsequent rows
#    - Checked if target < mattrix[row][0] (minimum of that row)
#        - If it's less than, only check all previous rows
#    - Else, it's within that row and that's the row
```

```ruby
# Neetcode's method:
# - Top/bottom
# - Check if less than minimum of row, or greater than maximum of row

# Index math method
# left = 0
# right = (m * n) - 1: Ex. 11
# How to get row/col to check every time?
# What is the middle? (Left + right) / 2 = 5
# How to get row? Middle / n (4) = 1
# How to col? Middle % n (4) = 1
```

```ruby
# m x n integer matrix:
# 1. Each row is sorted in non-decreasing order
# 2. First integer of each row is greater than last integer of previous row
#     E.g in a 3x4 matrix, m[1][0] is greater than m[0][3]
# Must run in log (m * n) time complexity aka binary search
# Return true if in matrix or false otherwise

# What is the search condition?
# left should start at row 0
# right should start at row 2
# What should the middle be? 1
# Maybe it's kind of two binary searches in one? One to find row, another to find column.
# Doing the column search doesn't seem to make sense until row is found.
# Find row, then call another binary search on the column?
# So, let's say 11 is the target: we can do this
# - If target is equal to current row max, return that row, col aka length 2 == true, length 1 == do col search
# - is target LESS than current row max? That means it's part of current row or before that
#     - Does a [-1] row exist? If it doesn't, this is the right row
#     - If it does exist
#         - If target is greater than it, return row
#         - else use that row and below (discard this row and above)
# - Is target greater than current row max? Disregard all prior rows and move rows to + 1
```
