```ruby
=begin
coins of diff. denominations, amount: total amount of money
fewest # of coins to make up that amount
infinite number of each coin

At each intersection, you can choose any coin out of coins (n-tree)
Example:
amount = 11, choose 5
amount = 6, choose 5
amount 1, choose 1
Sub-problems are based on amount remaining.
If amount is 1, there is only xyz ways to choose that number of coins...
If amount is 6, there is only xyz ways to choose that number of coins...
Repeated work through duplicate subproblem

Memoized:
Think about it this way: 11 amount
when you're at 11 total, there are 0 coins to hit 11
if you're at 10 total, there are 1 coins to hit 11 (1, 2, 5), pick 1
If you're at 9 total, there are 1 coins to hit 11 (1, 2, 5), can
pick 1 + 10 total (1) = 2 coins, or just pick 2 and be there in 1 coin.
... and so on.

For bottom-up DP?
11, [1, 2, 5]
0 -> 0 coins to make 0
1 -> 1 coin can make 1
2 -> 1 coin or 2 coins can make 2, choose min (1 coin)
3 -> 3 coins or 2 coins can make 3, choose min (2 coins)
...
Also whenever you get a previous value e.g
3 -> 3 - 1 = 2 (can make in 1 coin) + 1 coin you chose
3 -> 3 - 2 = 1 (can make in 1 coin) + 1 coin you chose
=end
```
