```ruby
=begin
robbing houses along a street
each house has x money
houses arranged in a circle
first house is neighbor of last
adjacent houses = security system
return max amount of money you can rob tonight w/o alerting police
[1, 2, 3, 1, 5, 6, 7, 8]
If you pick 1st, can't pick last-- that's it!

Naive:
current value + max of [next 2, next 3]
Call House Robber I on subset of data (1..-1) and (0...-1)
E.g, 2nd including last, 1st not including last

Memoize, DP, etc.
=end
```
