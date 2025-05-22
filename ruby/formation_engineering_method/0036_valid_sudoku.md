```ruby
# Determine if a 9x9 sudoku board is valid
# Only FILLED cells must be validated
# 1. each row must contain 1-9 no repetition
# 2. each column must contain 1-9 no repetition
# 3. each of the nine 3x3 sub boxes must contain 1-9 without repetition

# Go row by row, if any row contains duplicate numbers, it's over
# Go col by col, if any col contains duplicate numbers, it's over
# (Can do the row by row and col by col check at same time, honestly)

# Box check is:
# 0-3 row, 0-3 col
# then 0-3 row:, 3-6 col, 6-9 col
# Then 3-6 row... 3-6 col, 6-9 col...
# Then 6-9 row, 3-6 col, 6-9 col

# Assuming no need to check for anything but 1-9 and '.'
# Plan:
#     Create a valid_line, checks for any duplicate numbers (Use tally?)
#     # Check each row and col
#     0 to 9 do row
#         row = []
#         col = []
#         0 to 9 do col
#             row << m[row][col]
#             col << m[col][row]
#         return false unless valid_line row and valid_line col

#     # Check boxes
#     row = 0
#     while row < 9
#         col = 0
#         while col < 9
#         box = []
#             for (row...row + 3)
#                 for (col...col + 3)
#             box check
#             col += 3
#         row += 3
# return true
```
