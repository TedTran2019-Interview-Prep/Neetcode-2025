```ruby
=begin
people where people[i] is weight of the ith person
infinite # of boats
each boat can carry a maximum weight of limit
each boat carries at most 2 people at same time, sum of weight is at most limit
minimum # of boats to carry each given person

people = [1, 2], limit = 3
Want each boat to carry the least amoutn of people possible
People will always be <= limit and >= 1
Sort array
[1, 2, 2, 3], limit = 3
L         R
If L + R <= limit
L += 1, R -= 1, += 1 boat
If R <= limit, += 1 boat and decrement R. 1
[1, 2, 2]
L      R
What happens when L == R? +1 boat
=end
```
