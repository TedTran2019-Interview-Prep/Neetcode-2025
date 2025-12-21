```ruby
=begin
Rotate array to the right by K steps (k is non-negative)
Must modify nums in place, try to think about O(1) extra space
[1, 2, 3, 4, 5, 6, 7], k = 3
[5, 6, 7, 1, 2, 3, 4]

Naive: Easiest way taking O(N) extra space
Copy (index + k % length) into another array
Copy another array into original array

How do I do this using only O(1) extra space?
[1, 2, 3, 4, 5, 6, 7], k = 3
index 0 needs to go to index 3
index 3 needs to go to index 6
index 6 needs to go to index 2
index 2 needs to go to index 5
index 5 needs to go to index 1
index 1 needs to go to index 4
index 4 needs to go to index 0
...
Once a value is moved to its proper index, it's no longer "necessary"
[1, 2, 3, 4, 5, 6, 7], k = 3
Reverse
[7, 6, 5, 4, 3, 2, 1]
Reverse k elements, reverse rest of array
[5, 6, 7, 1, 2, 3, 4]
Damn.
=end
```
