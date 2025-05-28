```ruby
# Two sorted arrays nums1 nums2 of size m and n, return the median of both
# Time complexity should be log m * n
# What is the median?
# - If odd, middle value
# - If even, middle values / 2
# How would you get the median of both?
# Simple: merge two sorted arrays then return the middle, but that's O(N) to merge

# How could we do binary search on these sorted arrays to get the median?
# How can we discard HALF of what we know is not the median at any given point?

# NC solution and logic:
# 1. Split into two partitions (left and right), that consists of sorted halves
# 2. Max of left partition should be less than min of right partition
# - (Since there are two arrays, this is two separate checks with array A/B.)
# - E.g is array A's left max less than array B's right min, is Array B's left max less than Array A's right min?
# 3. Take the max of of the left partition, min of the right partition
# -infinity left, infinity right makes it easier to code (handles edge cases)

# I ain't even going to pretend that I can code this shit up, cuz' I can't. If I'm asked to solve this in log(m+n) time I'm leaving in O(1) time.
```
