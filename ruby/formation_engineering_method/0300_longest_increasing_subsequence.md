```ruby
=begin
Return length of longest strictly increasing subsequence
Numbers can be skipped, so it isn't just sliding window
(Order has to remain same, but numbers can be deleted)

Naive:
Brute force every subsequence (include or don't include)
Including only works if GREATER than max

[1, 2, 4, 3]
at index 0: [1] ->
[1, 2], [1, 4], [1, 3] ->
[1, 2, 4], [1, 2, 3]
at index 1: [2] -> [2, 4], [2, 3]
at index 2: [4] -> [4]
at index 3: [3] -> [3]

DP:
[1, 2, 4, 3]
At index 3, it can only be 1
At index 2, it can only be 1 (4 is greater than 3, no maxing)
At index 1, it can be 2 [1, index[2] + 1, index[3] + 1].max
At index 0, it can be 3 [1, index[1] + 1, index[2] + 1, index[3] + 1].max
=end
```
