This approach is N^2 and passed once I swapped the set for iteration to skip duplicated values

```ruby
# Sort array (nlogn)
# 1 0 1 2 -1 -4
# -4 -1 0 1 1 2
# For each number, say: -4, we look at [-1 to 2]
# [-4 -1 2], total is -3, which is less than 0.
# If any point equal to answer, add to results
# Then move left pointer up, right pointer down
# Left pointer starts at number's index + 1, right pointer just at end
# If less than zero, move left pointer up
# If greater than zero, move right pointer down
# Repeat for 0...length - 2 elements
# Is a set still needed to check for duplicates? I think so.
# 3sum basically builds on two_sum_ii, it's just that problem but on a loop

# Set makes it too slow when removing duplicate triplets, supposedly.
# Since it's sorted... can skip over any values already used.
# Don't want to repeatedly use first value, second value, or third value
# So for the outer loop, skip as long as i > 0 and the curr == the last one
# For inner loop, once you find a valid answer, skip all repeats left/right

# Plan:
# results = []
# nums = nums.sort!
# 0 upto array.length - 2 each i
#     while left < right
#         left = i + 1
#         right = array.length - 1
#         if i + left + right == 0
#             add to results
#             left += 1
#         elsif total > 0
#             right -= 1
#         else
#             left += 1

# =end
```

This approach is N^2 and failed.

```ruby
# Solution set must not contain duplicate triplets
# nums[i] + nums[j] + nums[k], none of them equal, and all == 0
# Easiest solution:
# Put pointers I, J, K at [0, 1, 2]. Then move from k-last. Then once that is done, move j forward one, then go k to last again... rinse and repeat, until I to last - 2, j to last - 1, k to last. This is an N^3 approach, which isn't effective

# Maybe N^2 approach: Do two sum, get the sum of every two numbers added?
# a + b + c == 0
# 0 - (a + b) == c
# But you need every combination of two characters?
# -1 0 1 2 -1 -4
# [-1, 0], [-1, 1], [-1, 2], [-1, -1], [-1, -4]
# [0, 1]... and so on
# 0 - (-1) = 1, so if you find a 1, that tracks
# N^2 + N
# But you have to watch out for duplicates
# e.g if a number was already used, it can't be used again
# Count the occurrences of every character, you can't use more than the amount.
# This would be a working solution-- but is it ideal?
# Finding a third value...
# To not deal with repeats:
# -1 0 1 2 -1 -4
# I will always only go up to 2
# J will only go up to -1
# Then K will be able to reach -4?
# So... K always has to be greater than J...
# Meaning: we can store the J index for each two_sum, then skip unless K's index is > J
# I misunderstood the problem-- duplicate triplets are NOT allowed, even if they are a possibility. Okay, toss all arrays into a set and don't add if they're already inside.

# Plan:
# two_sum = Hash.new { |h, k| h[k] = [] }
# answers = []
# exists = Set.new
# iterate through nums up to two before last, for each num
#     iterate from above loop + 1 to end - 1
#         a = nums[outer loop]
#         b = nums[inner loop]
#         do hashmap[0 - (a + b)] << [[a, b], b's index]
# iterate through nums, for each num with index
#     if num exists in two_sum[num]
#         go through the arrays, each array, j's index
#             if k index > j's index
#                 add num to array
#                 next if exists.includes? new array.to_set
#                 add entire array to answers
#                 add set to exists
# answers
```
