```ruby
=begin
Candidates, target
Unique combinations in candidates that sum to target
Each number in candidates may only be used ONCE (If there's 2 1's, you can use 1's twice)
Candidates are NOT distinct

Think about it in terms of a decision tree
Your path either has a 1, or no more 1's
Then for the 1's path, your path either has another 1, or no more 1's.
This is quite easy to implement because of index > start, aka when start == index, the number
can still be used. This means that we get to use each number the amount of times they appear
in candidates, but without treading down duplicate paths. Clever!
=end
```
