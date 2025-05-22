```ruby
# Int array height with length N
# N vertical lines
# Maximum amount of water a container can store
# It's just going to be (right - left) * [nums[left], nums[right]].min
# As you move forward or backwards, the length is always getting smaller, but you're
# doing a tradeoff potentially more height
# I guess you'd move pointer to pointer
# Basically, check if left's or right value is greater, then go there
# Move while left < right
# Compare max as you're travelling

# Plan:
# most_water = 0
# left = 0
# right = height.length - 1
#     while left < right
#         water = (right - left) * [heights[left], heights[right]].min
#         max = [max, water].max
#         if heights[left] > heights[right]
#             move right backwards
#         else
#             move left forwards

# most_water
```
