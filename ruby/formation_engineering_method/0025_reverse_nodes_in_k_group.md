```ruby
# Given the head of a LL, reverse the nodes of the list K at a time, then return the modified list
# K is a positive integer less/equal to length of the LL
# If # of nodes isn't a multiple of K, left out nodes remain as is
# Only nodes themselves may be changed, not the values
# 1 2 3 4 5, 2
# 2 1 4 3 5
# 1 2 3 4 5, 3
# 3 2 1 4 5
# Easy way using a lot of memory:
# have an array storing LL nodes in order by index
# slice array and reverse by K (if slice is less than K, leave as is)
# join array together slices together
# go through the array, reconnecting the LL nodes

# Follow up: O(1) space... DAMN IT
# Had to give up and look at NC's solution-- I couldn't code it.
# - I actually got super close, though... I just couldn't properly reverse for some reason, which should have been the easiest part?
```
