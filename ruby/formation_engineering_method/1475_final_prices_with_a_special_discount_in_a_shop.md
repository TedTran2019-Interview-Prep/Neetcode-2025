```ruby
=begin
prices, prices[i] is price of ith item in a shop
if you buy ith item, receive discount equivalent to prices[j]
j is MINIMUM index that j > i and prices[j] <= prices[i]
return answer, answer[i] is final price you pay for ith item considering the discount

[8, 4, 6, 2, 3]
8 - 4 = 4 (j == 1, first index greater than i(0) and where prices[j] is less than prices[i])
4 - 2 = 2
6 - 2 = 4
2 =     2
3 =     3
[4, 2, 4, 2, 3]

Naive: N^2, move forward in array until lesser element is found
Better: Increasing monotonic stack
[8, 4, 6, 2, 3]
while current element is <= top of stack, adjust price and pop
add element to top of stack
=end
```
