```ruby
=begin
integer costs where cost[i] is cost of ith step
Once you pay cost, can either climb 1 or 2 steps
Can start from either 0 or 1
Minimum cost to reach top of floor (one beyond final index)

This is same as climbing stairs, BUT need to keep track of costs as well
Ending on the top == don't pay cost

Naive approach:
Go 1 or 2 steps up the costs array
If one beyond final index, done! Compare w/ min

Better approach:
Store MINIMUM costs it takes to reach each step
[1, 100, 1, 1, 1, 100...]
For the 2nd index, it can either take: 1 or 100 to reach that point
At every index, you only need to store the minimum cost to reach it
[1, 100, 1, 1, 1, 100...]
[0, 0, 1, 2, 2, ...]
=end
```
