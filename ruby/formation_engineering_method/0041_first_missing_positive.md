```ruby
# Given unsorted array nums, return smallest positive integer NOT present in nums
# Must run in O(N) time and only use O(1) auxiliary space
# nums length will never be 0... no other restraints

# brute force: try 1-max value in nums, return earliest that exists in array. O(N) scan * O(N). If max value is less than 1, return 1. If the scan doesn't find anything, return N + 1

# [7 8 9 11 12] -> (length of array is 5)
# Brainstorm:
# Wait a second. [7 8 9 11 12], indexes 0-4
# If 1 exists in the scan, mark it as [1 - 1] = lands in index 0, marking 7 as negative
# If 2 exists in the scan, mark it as [2 - 1] = lands in index 1, marking 8 as negative
# Go through a single scan, marking [0-4] negative if that number shows up
# If the entire array is negative, that means for a length of 5, 1-5 showed up, so return length of array + 1. ELSE, for the first positive number, found, return index + 1.

# [3 4 -1 1]
# First pass:
# [3 4 x 1] (Dump anything less than 1, greater than nums.length) to X
# Second pass:
# [-3 4 o -1] Change x to o, positive to negative if found
# If value is x, change to o.
# If value is o, skip.
# If value is negative, take the abs (num.abs - 1).. actually just always take the abs.
# Third pass:
# Return index + 1 of first positive value or 'x'
# If not, return nums.length + 1
```
