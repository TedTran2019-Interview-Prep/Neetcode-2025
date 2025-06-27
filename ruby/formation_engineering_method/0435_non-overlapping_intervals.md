```ruby
=begin
Non-overlapping intervals
Intervals where [start, end] inclusive
Return minimum # of intervals to remove to make rest of intervals non-overlapping
Intervals that only touch a point are NON-OVERLAPPING

[Start, End]
If two intervals overlap
-> remove the one with the bigger end
-> increment remove counter
else
-> prev = current
-> move onto next
=end
```
