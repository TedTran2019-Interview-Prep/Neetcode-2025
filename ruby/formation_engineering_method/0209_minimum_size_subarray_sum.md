```ruby
=begin
given array of positive integers nums, positive integer target
min length of subarray whose sum is >= target
No such subarray = return 0
[2, 3, 1, 2, 4, 3], target = 7
prefix sums: [2, 5, 6, 8, 12, 15]
two_sum: is there any subarray whose subarray - subarray == target?
All positive, so can subtract future subarrays with previous ones
If any of the number themselves == target, return 1
[2 + 7] = hit a 9, success
[5 + 7] = hit a 12, success
[6 + 7] = hit a 13, success
[8 + 7] = hit a 15, success (store index, so do curr index - previous and check against min index)
...
Oh, GREATER OR EQUAL TO TARGET, NOT JUST EQUAL. I misunderstood the problem.

Okay if just greater:
Check sliding window
If >= target, check value then move left
else move right
Done when right is out of bounds

A cleaner way to do this would be to add right
Then subtract left while >= target
So there's no need to loop forever and break mid-loop when right is out of bounds and called
=end
```
