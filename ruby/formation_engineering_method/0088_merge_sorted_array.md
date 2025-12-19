```ruby
=begin
nums1, nums2 sorted in non-decreasing order
m, n representing # of elements in each
merge nums1/nums2 into a single sorted array
nums1 has length of both, should store entire sorted array

[1, 2, 3, 0, 0, 0]
[2, 5, 6]
Start at last index of array 1:
Compare m/n's indexes (6, 3)
Put 6, 5 in
[1, 2, 3, 0, 5, 6]
[1, 2, 3, 3, 5, 6]
[1, 2, 2, 3, 5, 6]
Then since each array is always sorted, don't need to worry about overwriting
=end
```
