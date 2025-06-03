```ruby
# unknown # of rabbits
# n rabbits "how many rabbits have same color as you?"
# minimum # of rabbits
# [1, 1, 2] = length of array == already 3 rabbits
# 1 = one other rabbit of this color somewhere
# 1 = one other rabbit of this color somewhere
# the two 1s could be referring to each other
# 2 = two other rabbits of his color somewhere NOT within the array
# 3 + 2 = 5
# [10 10 10] = 3 rabbits from length of array
# 10 = 10 other rabbits of his color somewhere
# 10 = 10 other rabbits of his color somewhere
# 10 = 10 other rabbits of his color somewhere
# If these rabbits are all the same color, what does that mean?
# 11, just the rabbit + the other 10
# What if it's [3 3 3 3 3]?
# 3 = 3 other rabbits of his color somewhere
# It would be 4 (3 + 1), then 4 (3 + 1) = 8
# It's basically:
# Count the number of rabbits in a hashmap
# Go through the rabbit map (unique) so no duplicates, then add to the total # of rabbits like this
#     if you land a 3, and there's less than or equal to 4 rabbits, it equals to (3 + 1)
#     else if you land a 3 and there's more than 4 rabbits... imagine there were 14 rabbits, you
#     would want 16 as the value. What's the math for that?
#     think if you have a value of 10, if there were 11 rabbits with the value 10, the answer would be 11. But if there were 12, the answer would be 11 + 11 = 22.
#     12/fdiv(11).ceil * 11
#     14.fdiv(4).ceil * 4 DONE
```
