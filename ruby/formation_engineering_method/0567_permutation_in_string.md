```ruby
# My solution is pretty good, but I have a realization: this is a fixed size sliding window problem.
# I just solved it like a regular sliding window problem (which is okay), but I should have realized
# in addition to what permutations means, is that a window is only valid if the exact size of s1.
# Let's try doing it again just to drill in a fixed size sliding window problem...

# "Fixed size sliding window" style of thinking
# Whenever window is greater than size of s1, shrink by going left
```

```ruby
# Given two strings, return true if s2 contains a permutation of s1, otherwise false
# Return true if one of s1 permutations is a substring of s2
# What would the brute force be?
# - Generate all permutations of s1
# - Check if s2 contains any of those permutations?
# - Factorial time complexity, no thanks-- how can I simplify work?

# What is a permutation? Every single ordering of the string.
# - Couldn't I just create a hashmap listing all characters of s1
# - Then if those characters appear in s2 (every possible order of those chars in s1 is handled) in a window, it's true? Otherwise false
# So if the character doesn't exist in the s1 hashmap, invalidate everything before
# If too many of a character, move left pointer until it has the appropriate number

# Plan:
# create hashmap tallying up s1
# left = 0
# hashmap for s2
# iterate s2, right pointer
#     increment hashmap[right char] by 1
#     return true if hashmap 1 == hashmap 2

#     while hashmap 2 [right char] > hashmap 1 [right char]
#         remove elements from hashmap
#         move left pointer
# false
```
