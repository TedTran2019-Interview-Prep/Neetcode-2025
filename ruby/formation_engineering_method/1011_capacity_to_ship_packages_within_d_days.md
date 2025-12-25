```ruby
=begin
one port to another within days
ith package has a weight of weights[i]
load ship with packages in order given by weights
may not load more than maximum weight capacity of the ship
return LEAST weight capacity of ship that will result in all packages on the conveyor belt being shipped within days days
MUST be shipped in order given

Sum up value of all weights
left: Honestly doesn't matter: minimum, first value, 1, whatever.
right: total value
while left <= right
Return right (minimum capacity) at end when loop breaks

If function returns true: within days, all can be shipped
If function returns false: cannot all be shipped within days

O(N) check, just subtract capacity until not able
When not able, reset to maximum and - days
Continue until out of days (RIP) or managed to ship all
=end
```
