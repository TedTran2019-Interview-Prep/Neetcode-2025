```ruby
=begin
nums sorted in ascending order with DISTINCT values
left rotated at an unknown index
return index of target if in nums, else -1
binary search
[4,5,6,7,0,1,2], target = 0
Rotated left by 3
One side is always sorted... how to tell which side is the sorted side?
left: 0
right: 6
middle: 3
If left < middle, left side is sorted
    if in left side, left else right
else right
    if in right side, right else left

left <= middle to deal with left/middle same
=end
```

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
