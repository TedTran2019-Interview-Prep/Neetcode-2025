```ruby
=begin
Intervals [start, end] inclusive
Merge all overlapping
Return an array of non-overlapping intervals
make new array
sort old array
first element = target
compare first with second, overlap?
-> combine into prev, go next
else
-> place the "prev" element
new element becomes the prev
At the very end, add the "prev" element to the new array
=end
```
