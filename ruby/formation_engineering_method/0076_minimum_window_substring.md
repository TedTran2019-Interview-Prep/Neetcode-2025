```ruby
# Given S/T of lengths M/N, return minimum window substring of s
# EVERY char in T (including duplicates) is included in the window
# If no such substring, return ""
# Answer will be unique

# ABC
# ADOBECODEBANC
# BANC (Has an N in it)
# MINIMUM window

# ADOBECODEBANC
# [ADOBEC] -> [DOBEC]
# [DOBECODEBA] -> [ECODEBA]
# [ECODEBANC] -> [ANC]

# Brainstorm:
# Go all the way right until you reach a valid substring
# Go left until invalid
# Keep track of minimum length whenever valid
# Use hashmap S == hashmap T
# Ignore values that aren't in hashmap T

# Plan:
# go through T, creating a hashmap
# Create a hashmap for S
# left = 0
# minimum_substring = ''
# minimum_length = infinity
# s.each do right
#     add to hashmap (don't add if not greater than zero in T)
#     keep track of minimum length if valid (map s == map t) + minimum substring
#     go left until invalid (ONLY IF VALID), take min
#         subtract from hashmap while doing so (only need to do if > 0 in T)
# return minimum_substring

# Case not considered: window can have MORE elements than in T and be valid (e.g for ABC, it can have two A's and be valid)
# - Keep track of total numbers in T
# - When total in window == total in T, valid!
#     - Only add when count in window is smaller than count in T
#     - Only subtract when count in window is smaller/equal than count in T
# Lesson learned: It's often easier to go character by character for right pointer. Also, think about what left going to invalid does (it's shrinking to the minimum window for that valid portion)
```
