```ruby
# n cars at miles away from start mile 0
# traveling to reach mile target

# given: array position and array speed
# position[i] = start mile of ith car
# speed[i] is the speed of ith car

# - cars cannot pass other cars
# - cars can catch up and travel next by it at the same speed
# - fleet = car/cars driving next by each other (speed of a fleet = minimum speed of any car in fleet)
# - car catches up to car fleet at mile target == still considered as part of fleet
# - return # of car fleets
# target: 12
# position: 0   3.  5.  8. 10
# index:    2   4.  3.  1.  0
# speed:    1.  3.  1.  4.  2
# rounds:   12  3.  7.  1.  1
# Easiest way is to iterate through every fleet, combining fleets and setting a minimum speed based on slow car, then iterate until every fleet has reached the end.

# For (target - position) / speed (then ceiling it)... for each, this is how many rounds it takes for each car to reach the end (provided it isn't blocked by a car further up)

# 3 < 5 (original position)
# But only needs 3 rounds to reach the end, so it'll become a fleet
# For a lower position to catch up with a higher position, it must have higher speed (so the higher position will b slower)
# 0 < 3 (orig position)
# but 12 > 3, so never catches up and stays as its own fleet
# 5 < 8
# But 7 rounds vs 1, so never catches up
# 8 < 10
# But 1 round each, so it catches up
# In total: 3 fleets
# If position == same, same fleet
# If position < next and rounds less or equal, same fleet
# When this rule doesn't apply, do += 1 fleets

# Problem: What do I do when the positions aren't sorted?
# Would an nlogn solution even be ideal?
# Sort an array of tuples of [round, position] by position, then go through it applying the above rules.
# Problem: Like previously mentioned, what happens if a car is blocked by a car further up? E.g, due to blockage, the a previous car's speed is reduced to the point where a car further back can catch up. This means that
# 1. Have to go right to left (deal with delayed cars)

# Example:
# position: 0   3.  5.  8. 10
# index:    2   4.  3.  1.  0
# speed:    1.  3.  1.  4.  2
# rounds:   12  3.  7.  1.  1
# position 3 car reaches position 5 car, will take same amount of rounds as position 5 car to reach end
# So as long as position 0 car's rounds is less than position 5's rounds, it'll catch up.

# fleets = 1
# min = nil
# So sort by [position, speed] tuple, sort by position
# Then traveling from right to left
#     see the amount of rounds it takes for that pos/speed to reach end
#     compare with min
#     if it's less than or equal to min, same fleet. Keep min
#     If its' greater than, add fleet += 1, change min to current value
# fleets

# Problem misunderstood: car doesn't stop at the finish line
# Has to check amount of fleets BEFORE/AT line, cars keep going. Meaning, don't ceiling the value-- has to be an exact match or less to be part of the same fleet.
```
