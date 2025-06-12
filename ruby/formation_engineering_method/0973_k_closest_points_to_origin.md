```ruby
=begin
Array of points [x, y]
k -> return k closest points to origin
distance between two points is square root of ((x1 - x2)^2 + (y1 - y2)^2)
max heap where: first value is Euclidean distance, second is coordinates
0, 0 -> [0, [0, 0]]
0, 1 -> [1, [0, 1]]
Keep heaps within size K
- use offer (so need to add and pop)
- But could always just add and pop until size <= k (for shorter code)
Same as kth largest in stream, but with closest (smallest) instead of largest.
- So utilize a max heap instead of a min-heap
- also Euclidean distance I guess? But that didn't really make it more difficult
- maybe having to slightly customize the heap? (take in distance and point)
- I guess this is the Kth largest/smallest pattern?
=end
```
