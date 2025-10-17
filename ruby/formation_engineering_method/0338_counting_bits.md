```ruby
=begin
Given integer n
return array of length n + 1
ans[i] is the number of 1s in the binary representation of i

Naive: A lazy way could be to just use the count bits solution from before but on a loop?

Better solution?: DP!
Look at how the earlier parts of the problem can be used to compute the later...
0: 0000
1: 0001
2: 0010
3: 0011
4: 0100 (This is just the most significant 1 + 0 (which has zero 1s))
5: 0101 (Most significant 1 + 1 (which has one 1s))
6: 0110 (Most significant 1 + 2 (which has one 1s))
7: 0111 (Most signiciant 1 + 3 (which has two 1s))...
8: 1000
Pattern is 1 + dp[n - 4], 1 + dp[n - 8], 1 + dp[n - 16]...
The offset is the most significant bit reached so far.
0000 = 1 + dp[n]
0001 = 1 + dp[n - 1]
0010 = 1 + dp[n - 2]
0011 = 1 + dp[n - 2]
0100 = 1 + dp[n - 4]
0101 = 1 + dp[n - 4]
...
1000 = 1 + dp[n - 8]
...
=end
```
