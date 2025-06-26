```ruby
# Given an array of time interval objects
# [start, end] inclusive
# Determine if a person can add all meetings to their schedule with no conflicts
# Aka, are there any overlapping points?
# Sort array by left number
# If there's a direct overlap (touching is okay, overlapping is not) return false
# If go thru entire array, return true
# aka, with two intervals:
# [0 30], [5, 10]
# 5 is less than 30, so overlap!
# >= is okay
```
