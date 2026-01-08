```ruby
=begin
car with capacity seats
only goes east ->
integer capacity, array trips
trips[i] = [num passengers, from, to]
locations are # of kilometers from car's initial location
true if possible to pickup and drop off all, false otherwise

So it's a simulation problem:
Car is traveling east
You have x capacity
Can you pickup and dropoff everyone along the way

Sort trips by from (this is starting position)
- No need to have to as tiebreaker since we need to alwys pickup all at the same time if same from
(are there any ranges where # of passengers > capacity?)
Whenever we hit time, add "to" to heap
With a new time, pop all capacities <= to heap before adding new time
If capacity is ever exceeded, return false
Return true at end

to is always greater than from

Try out NC's O(N) solution
=end
```
