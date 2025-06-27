```ruby
=begin
2D integer array intervals, [left, right] inclusive
Size is right - left + 1
queries: jth query is the size of the smallest interval i such that left <= queries[j] <= right
OR -1
Problem: Smallest interval is determined by END as well.
Query has to be WITHIN [start, end] but start end size also has to be smallest
Is a N^2 solution fine? Trying each query that's within the interval, then going through to pick the smallest every time... but that seems inefficient
Or you could sort by size, then run through until you find a match, rinse and repeat
Also N^2 potentially
Okay a slightly better solution: but not by much... and requires use of a min heap
Basically don't need to go back, since we know if start is earlier, it'll be fine for later.
Then we only need to check if the end is greater or equal to element to see if it's valid
So intervals only need to ever be added to the heap once

Go through queries
    Remove invalid intervals in heap that don't match query
    Go through intervals, adding intervals that match that query into heap (size, end)
    If heap is empty, -1 else peek for smallest to add to array
Issue: Since queries are sorted, you need the original order to add to answers
Let queries.each_with_index.to_a then sort that!
=end
```
