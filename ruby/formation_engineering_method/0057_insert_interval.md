```ruby
=begin
Array of non-overlapping intervals
Inclusive [start, end]
Intervals are already sorted by start
Also given: new interval [start, end]
Insert new interval into intervals so that intervals is still sorted
AND no overlapping intervals (you are allowed to merge overlapping intervals)

What are the cases?
new interval end time is before first interval start time
new interval start time is after last interval end time
new interval range [start, end] is within 1+ intervals ranges
How to know if within range?
- The start of new interval is within start, end of another interval.
- The end of new interval is within start, end of another interval

Make a new intervals array
If intervals is empty, add new intervals to it and you're done
If new intervals end is less than intervals first element's start, add new_interval to start of intervals and return
If new intervals start is greater than intervals last element end, add new interval to end of intervals and return
OTHERWISE
Iterate through intervals
IF new interval overlaps, COMBINE
ELSE
If new interval's start is less than or equal to current element start, that's where it belongs
Add the new interval then add the element itself

The above got close, but no cigar
Better to:
1st case with no overlap: current interval ends before new starts
2nd case with no overlap: current interval starts after new ends
- With this, you know it's where new interval belongs
Else it's overlap, and you combine into a transformed new
With 1/2, add interval to result so you have all the elements...
=end
```
