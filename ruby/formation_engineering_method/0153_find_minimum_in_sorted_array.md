```ruby
# Rotated sorted array
# 0 1 2 3 4
# 4 0 1 2 3
# 3 4 0 1 2
# 2 3 4 0 1
# 1 2 3 4 0
# If middle < right, right half is sorted
#     - If right half is sorted, the middle is already the minimum of right half, so take the left half
# If left < middle, left half is sorted
#     - If the left half is sorted, middle is the GREATEST of left.
#         - Search right half, why?
#         - Right will only have the higher then the lowest value
#         - If left had the lowest value, it'd be a fully sorted array (search left)
#           - Or just do min = [min, left].min and return instead of pointlessly continuing searching left
# Keep track of min (value you tried at xyz index)
# I think this only works if you do middle < right first too, just in case both halves are sorted, you take the left.
```
