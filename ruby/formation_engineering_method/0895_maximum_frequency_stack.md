```ruby
=begin
stack-like to push elements to stack and pop most frequent element from stack

Naive:
Push element into stack
Store count of element in hashmap
Sort stack by count (This is nlogn per operation)

Better?:
What about a heap?
Heap can store count of element + element
Heapify is O(N), then heapify then pop for every pop
Heap solution would also have to store index of element inside of the stack as a tie breaker

Better:
[5, 7, 5, 7, 4, 5]: stack
hashmap storing counts: {}
N: look through stack for max count
N: delete element closest to top of stack, decrement in count
2N per pop

Can we get N down to logn or constant time?
For deletion: each val has a hashmap of indexes it was last seen at (or just a plain ID)
Go to most freq val with highest last seen index, pop that, done.
count itself can be a store of said indexes (array.length)
This is much more efficient.

Iterating through hashmap which is O(N) if every element only appears once, but with a lot of repeats we can get the time down significantly.
O(N) solution fails.

Instead of iterating through the entire k,v-- how do we keep a track of the max and the max values?
Keep track of MAX through utilizing a hashmap -> set.
hashmap is of count -> values at that count
When a value is removed, remove and subtract, then iterate from that number in hashmap downwards until non-empty empty set is found

Oh, I can make it more efficient by not using IDs.
I can just use the value itself in its count group, then pop from said count group.
The reasoning behind this is that since order is required, lists are better.
=end
```
