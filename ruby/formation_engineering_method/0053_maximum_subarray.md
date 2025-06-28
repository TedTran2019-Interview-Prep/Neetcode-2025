```ruby
=begin
Find subarray with largest sum and return its sum
Kind of like sliding window in a way?
Only need the sums, not the actual array
A subarray with nothing in it would be 0? Or not allowed?
I guess keep adding values to sum, reset to 0 when it gets negative, then continue
And keep track of max?

sum = 0
max_sum = 0
nums.each do num
    set sum to 0 if it's negative
    add num to sum
    max of max sum and sum
return max sum
=end
```
