```ruby
=begin
kth highest test scores in real time
If an element smaller/equal than kth is added, ignore it
If an element larger than kth is added, order changes.
- The next greatest element replaces kth
Heapify into min-heap
Pop until heap is size K
Keep heap, only add an element if it's greater than top of heap (and pop off top of heap), choose next element as kth largest
=end
```
