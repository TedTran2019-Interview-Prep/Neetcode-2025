```ruby
=begin
Given nums and integer k
Return total # of subarrays whose sum equals to K
Subarray: contiguous non-empty sequence of elements within array
Numbers can be positive or negative

Brute force solution:
Try every contiguous subarray
[1], [1, 2], [1, 2, 3]
[2, 3]
[3]

If you had [1, 2, 3, 4]
[1], [1, 2], [1, 2, 3], [1, 2, 3, 4]
[2], [2, 3], [2, 3, 4]
[3], [3, 4]
[4]
[1, 3, 6, 10]: prefix sums
First run: values are just prefix sums
Second run: prefix sums - prefix sums 1st value
Third run: prefix sums - prefix sums 2nd value
Fourth run: prefix sums - prefix sums 3rd value
Isn't this still N^2 but without repeating the addition?
How do we reduce that work?

Prefix sums + two sum in a way?
Start with 0 -> 1
[1] -> check if sum - k == value prev calc, if so, increment total by count of value prev calc
increment hashmap count (1 -> 1)
[3] -> check if sum - k == value prev calc, if so, increment total by count of value prev calc
increment hashmap count (3 -> 1)
...

It's basically two sum on a prefix sum map..
[1, 3, 6, 10], k = 3
2
[1, 2, 3], k = 2
2
=end
```
