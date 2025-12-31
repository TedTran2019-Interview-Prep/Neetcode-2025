```ruby
=begin
Circular queue
Doubly Linked list vs array w/ index math implementation
head, tail
Set max limit of nodes to be K
If front, look at head.next
If rear, look at tail.prev
If enqueue, add an element from tail
If dequeue, move head forward and change prev to head
isEmpty just checks size == 0?
isFull checks if size == k

Array w/ index math implementation is a bit more complicated
front
rear
size
capacity

If size is zero, it's empty
If size == capacity, it's full
Front: Look at front IDX
Rear: Look at rear IDX
Enqueue: If not full, % capacity then time to work
- Rear starts at -1, go to 0: rear moves forward 1
- Front can start at 0...
Dequeue: If not empty, % capacity then time to work
- set to nil, Front += 1
- If size == 0, set rear back to -1 and front back to 0
=end
```
