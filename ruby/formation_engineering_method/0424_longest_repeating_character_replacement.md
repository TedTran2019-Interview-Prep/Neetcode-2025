```ruby
# Given a string s and integer k
# Choose any char of string and change to any other letter
# Perform this operation at most K times
# Length of longest substring containing same letter within above operations

# I think this is a sliding window problem, so O(N) time complexity
# left pointer at start, right pointer at start
# What is the condition? All characters the same or DIFF characters <= k
# O(26) to search through an uppercase letter hashmap
# Issue: as you move left pointer forward, the "copy pointer" changes
# Maybe inside of the window, make whatever is most common the 'letter'?
# total sum of window
# Minus that sum by the count of the most common (max value)
# Is that remaining value less than or equal to K?
# You can't just move forward-- have to change whatever is most common within the window to become the 'main'.
# max_freq is very clever-- if max_freq doesn't increase, potential best answer doesn't change, so
# it can simply stay the same. Regardless, solution utilizing hashmap vs max_freq are both O(N)
```
