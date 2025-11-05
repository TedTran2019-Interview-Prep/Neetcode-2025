```ruby
=begin
two strings: text1 text2
return length of longest common subsequence
return 0 if no common subsequence
subsequence: new string gen from orig string w/ 0+ chars removed without changing the relative order

Naive:
generate every possible subsequence for text1
generate every possible subsequence for text2
Find longest matching that are in both

Go left -> right
Don't want to repeat work...?

Finding the subproblem....
abcde -> [bcde]
ace -> [ce] then plus 1 since {a} matched
if
bbcde -> [bcde] OR [bbcde]
ace -> [ace] OR [ce]

2D grid
Go diagonal if match
Go left/right if don't match, then put max value from those into spot
Out of bounds = 0
Bottom-up DP because you need values in that direction
=end
```
