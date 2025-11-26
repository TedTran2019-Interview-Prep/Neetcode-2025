```ruby
=begin
mxn matrix, integer k
start at (0, 0) want to reach m - 1, n - 1
can only move down/right
return # paths where sum of elements on path is divisible by K
let's brute force it first
Unmemoized fails 73/88
Memoized passes all
Intuition: remember that you only care about sum of elements divisible by k
=end
```
