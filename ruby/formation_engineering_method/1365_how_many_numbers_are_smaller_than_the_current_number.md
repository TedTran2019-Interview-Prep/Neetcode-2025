```ruby
=begin
nums, each nums[i], how many #s in array are smaller than it
for more optimized, can sort nums
Then you know
[1, 2, 2, 2, 3, 8]
1 is greater than nothing
2 is greaer than 1
2 is greater than 1
2 is greater than 1
3 is greater than 1 and 2 (4 numbers)
8 is greater than 5 numbers
Basically just need to handle duplicate case
Issue: need to maintain original array order
hashmap: each number has # greater than mapped
then go thru original array, creating the smaller array
=end
```
