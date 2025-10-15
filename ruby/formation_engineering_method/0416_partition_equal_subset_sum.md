```ruby
=begin
true if can partition array into two subsets that the sum in both is equal
1 5 11 5: [1, 5, 5], [11]

Naive:
generate every possible two subset combination....
return true if their sums are equal
22
[1] -> [21]
[6] -> [16]
[17] -> [5]
[22] -> [0]
[11] -> [11] True
At every point, either add to subset A or add to subset B

Better: How to memoize? (index, remaining)
Easier: at which point does one subset become 1/2 of the total?
At each point, either include or don't include the current number

DP solution:
[1, 5, 11, 5] (Total 22, half 11)
At any given point, can either take or not take
5: {0, 5}
11: {0, 5, 11, 16}
5: {0, 5, 11, 16, 10, 21}
1: {0, 5, 11, 16, 10, 21, 1, 6, 12, 17, 22}
If a match with half at any point, return true!
=end
```
