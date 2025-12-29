```ruby
=begin
arr is a mountain array if:
arr.length >= 3
i within array that's greater than all left/right
Find target or return -1

This is just binary search once again
We know the array goes from lower to peak to lower
[1, 2, 3, 4, 5, 3, 1, 0, -1, -2, -3]
What if 5 is the middle? Left side sorted, right side sorted in reverse order(peak is chosen)
What if 4 is chosen as middle? Left side sorted, right side sorted in reverse order
What if 1 (index 6) is chosen as middle? Left side NOT sorted, right side sorted in reverse order
What if 2 is chosen as middle? Left side sorted, right side unsorted

IF element is greater than element to the left, left will always be sorted

You can either land in:
left rising: a[i] is greater than left, less than right
peak: a[i] is greater than left and right
right falling: a[i] is less than left, greater than right

Find peak through this check
If in left, left = middle + 1
If in right, right = middle - 1

Once peak is found
Binary search on left
Binary search on reversed sorted array (right)

Have a hashmap in case those values you checked are called again
(Or you could do logic to eliminate values based on checked values while finding the peak, but complicated and idk how feastible)

mountain arr length is up to 10000 and we only have 100 checks to MountainArray.get, so must be logn
What tripped me up about this problem: I thought we'd be only allowed exactly 100 checks and there'd be an input that made us do exactly that amount, so we couldn't be flexible with multiple checks at start.... but it seems like just logn time complexity is okay, even if at some points we have to do multiple checks. We can also use a hashmap to cache values we already checked.
Because essentially, it's logn to find the peak, then logn to binary search each half.
Would this be 2logn?

Improvement:
Instead of checkign before/after peak, can also only check after peak.
If value is greater than value after it, it's either the peak or the right side.
Break while left < right, return left
=end
```
