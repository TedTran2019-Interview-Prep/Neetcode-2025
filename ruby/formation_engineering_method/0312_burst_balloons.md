```ruby
=begin
n balloons, 0 to n - 1
Painted w/ a number represented by array nums
Asked to burst ALL balloons
If you burst ith balloon, you get nums[i - 1] * nums[i] * nums[i + 1] coins
If out of bounds when doing +1/-1, treat as balloon w/ 1 painted on it
return max coins

Done when no more balloons
max value....
state is remaining balloons, you'll always get the same added value with the same remaining balloons
If the max coins from 3158 is 167, you never have to recalculate that if you're solving 13158
Max state from [8] -> [58] -> [158] -> [3158]
From 8, max coins is 8
From 58, max coins is 48 (potential is 48, 45)
... each of these can reuse smaller calculations
Seems like this isn't the proper sub-problem to look for, it's still too naive

[3 1 5 8] -> [1, 3, 1, 5, 8, 1]
1, n.length - 2
l, r (1, 1)
base case is when l > r
What if I removed this number last is the intuition.
dp[l, r] = maximum coins obtained from bursting balloons between l and r
Yeah fuck this problem
=end
```
