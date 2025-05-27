```ruby
# n piles of bananas
# ith pile has piles[i] bananas
# Guards will come back in H hours
# k = banana/hr eating speed
# Each hour, chooses a pile of bananas and eats k bananas from that pile
# If a pile has k bananas, eats all and not eat any more during said hour
# Wishes to finish eating all bananas
# Return minimum K such that Koko can eat all bananas in H hours
# [3, 6, 7, 11], h = 8... answer = 4
# 4: eats first pile in an hour
# 6: eats second pile in two hours
# 7: eats third pile in 2 hours
# 11: eats third pile in 3 hours
# = 8 hours
# Minimum of bananas eaten per hour, but can still finish all bananas within H

# Brute force solution:
# Try numbers from 1 to maximum in array
# Return lowest number to work (1, 2, 3, 4)
# To check: (pile / speed).ceil, sum up and if it's <= H

# Slightly better solution:
# Do binary search on attempted numbers?
# Try 5: Works, less than H! Store as min, check lesser values
# Try 5: What if doesn't work? (Greater than H), check greater values

# Plan:
# left = 1
# right = piles.max
# min_speed = -infinity
# while left <= right
#     middle = left + right divided by 2
#     hours_to_eat = calc(array, middle)
#     if hours to eat > H
#         took too long with a low middle value
#         try a greater middle value (left = middle + 1)
#     else
#         managed to eat in time, store min speed
#         see if you can try a lesser middle value and still make it
#         right = middle - 1

# return false if min is equal to -infinity
# min
```
