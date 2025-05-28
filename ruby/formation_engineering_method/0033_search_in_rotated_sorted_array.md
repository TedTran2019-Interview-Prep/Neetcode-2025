```ruby
# nums sorted in ascending but rotated at unknown pivot index
# return index of target, or -1 if not in nums
# logn yay binary search
# 4 5 6 7 0 1 2 -> Always one sorted half

# if middle == target return middle
# if left < middle, left is sorted
#     if target between left/middle, go left
#     else right
# else (right is sorted)
#     if target between middle/right go right
#     else go left

# Be wary of the case where left/middle is the same element!
```
