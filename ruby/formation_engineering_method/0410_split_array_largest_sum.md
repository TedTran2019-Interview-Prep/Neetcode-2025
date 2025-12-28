```ruby
=begin
nums, integer k
split nums into k non-empty subarrays such that the largest sum of any subarray is minimized
return largest minimized sum of the split
subarray must be CONTIGUOUS

Naive:
DFS trying out every possible split
Iterate through the array
At any point, you could add this to current subarray or to the next subarray

Binary search:
Ideal = sum / k (not useful)
Maximum = sum
Minimum = highest individual of nums

Utilizing this:
L = min
R = max
Binary search?
Get middle value, then if array can be split into K groups where every single value is <= middle... that's the new minimum!
If > value aka not found, left = middle + 1 (try bigger)
else: right = middle - 1 (try to see if you can get a smaller minimum)
Return left (the minimum found)

This problem is very similar to capacity to ship packages within D days!
=end
```
