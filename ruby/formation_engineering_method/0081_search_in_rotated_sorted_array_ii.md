```ruby
=begin
nums sorted in non-decreasing (values not distinct)
nums is rotated around an unknown pivot
nums, target
true if target in nums, false otherwise
binary search to make it O(N), reduce overall op steps

[2, 5, 6, 0, 0, 1, 2, target = 0, means everything is moved forward 3
left = 0: value is 2
right = 6: value is 2
middle = 3, value is 0

left side is 2 to 0
right side is 0 to 2
One side is always guaranteed to be sorted
What can we eliminate?
If right side is sorted, guarantee all values between 0 and 2.
So if middle is between 0 and 2, pick right side.
- Pick right side by setting left = middle + 1... (can we do right = right - 1 as well?)
- (If middle or right is equal to target, can just return)
What if NOT in right side?
- So we know it's not in array or it's in the left side.
- We try the left side.
- If it's not middle and it's not left, then set right = middle - 1, (left = left + 1?)

Why does [1, 0, 1, 1, 1] fail? Target = 0
Left side is NOT sorted despite matching left <= middle condition
How do we know that a side is sorted?
Get next value (going thru dups), make sure that next value is in between left and middle

Neetcode way:
If left is less than middle, it's the left
If left is greater than middle, it's the right
else it's not checkable so we just increment left
=end
```
