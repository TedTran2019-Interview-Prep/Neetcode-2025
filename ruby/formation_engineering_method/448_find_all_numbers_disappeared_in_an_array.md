```ruby
=begin
nums of n integers where nums[i] in range of [1, n]
return all integers in range [1, n] that don't appear in nums
Hashmap, store counts
go from 1 to nums.length, if not in, then add to returned list
No extra space, O(N) run time?
Mark character - 1 at that index as negative to say that it's seen
Go through marked nums and add in what's unmarked
=end
```
