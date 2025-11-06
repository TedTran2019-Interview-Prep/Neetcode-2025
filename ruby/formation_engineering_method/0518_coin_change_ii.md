```ruby
=begin
coins of different denominations
integer amount
return # of combinations that make up amount
if cannot be made, return 0
infinite # of each kind of coin
Assume coins are sorted?

Naive:
Try out every combination

Better:
Cache by remaining amount + index (which coin you're on)

Better: unbounded knapsack problem
(DP solution with space optimization is more space efficient than the memoization solution), also faster...
  5 4 3 2 1 0
1 4 3 2 2 1 1
2 1 1 0 1 0 1
5 1 0 0 0 0 1
Basically bottom-up DP
Look right == amount - current coin, does that value have any possible combinations?
Look down == can I use any larger coins to make up this amount?
=end
```
