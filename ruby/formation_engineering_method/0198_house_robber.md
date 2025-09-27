```ruby
=begin
Rob houses along a street
Each house has x money stashed
Constraint == each adjacent house has security systems connected (contact police)
TWO ADJACENT HOUSES CANNOT BE BROKEN INTO ON THE SAME NIGHT
nums representing amount o fmoney in each house
max money can rob tonight
Max cost climbing stairs, maybe?
[1, 2, 3, 1]
You'd want 1, 3 (Only options are [1 3] and [2 1])
[5 1 1 5] -> [5 5]
From every point you choose, you want to see if the 2 house or 3 house is better
[2 7 9 3 1]
2 -> 9 -> 1, 2 -> 3
7 -> 3, 7 -> 1

Naive approach:
recursive where you do current + [call(next 2), call(next 3)].max
then compare [call(0), call(1)].max

Memoized approach:
memoize best answer at each index
return memo if it exists, don't recalculate

DP approach:
At any given point, you only need:
[2 7 9 3 1]
dp[0] = 2
dp[1] = 7
start at 9: you can add -2 or -3, whatever is better
onto 3: add 2 or 7, whatever is better
[2 7 11 10 12]
dp[-1]

DP no extra memory:
similar approach to above...
but encapsulate it step by step, starting with the beginning
=end
```
