```ruby
# Leetcode doesn't save if you didn't submit... damn.
# Cannot modify array nums, constant space, and O(N) time complexity
# Floyd's cycle detection algorithm:
# 1. Fast/slow, find intersection point
# 2. New slow, move both slow forward until intersection, that's the start of the cycle
# Start of the cycle is the duplicate number.

# Plan:
# # So slow doesn't equal fast at start
# slow pointer = nums[0]
# fast pointer = nums[nums[0]]
# until slow == fast
#     slow = same as above but slow instead of 0
#     fast = same as above but fast intsead of 0

# new slow = 0
# until new slow == old slow
#     move both forward

# return new slow or old slow, doesn't matter they're the same
```
