```ruby
=begin
matchsticks, matchstick[i] is length
use up all matchsticks to make 1 square
should not BREAK any stick (can link)
each can only be used exactly 1 time
true if can make square, false otherwise

What makes something a square? 4 equal length parts

Naive:
Try every single variation

Better:
Limit by sum of all matchsticks / 4
If any number is greater than that, return false
A better improvement: aim directly for the quarter value? No, doesn't make a difference..
Sort in reverse to end it early? E.g, try to place largest sticks first to cut off inefficient paths

Better: Prune additional paths
E.g if you have 4 sides of equal length
And you have to add a matchstick to one side...
You don't have to bother adding it to every side
4 sides are symmetrical
E.g if you tried every combination of top, there's no point just coming up with the same failed solutions again but rotated
You only want to try each DISTINCT side at any given point in time
=end
```
