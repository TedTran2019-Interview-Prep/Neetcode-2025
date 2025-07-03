```ruby
=begin
Backtracking permutations problem
Symmetry
Only need to handle 1, 2, 5
Multiply result of 1 and 2 by 4 and add to result of 5
1 2 3
4 5 6
7 8 9
What are all the potential crosses, knowing they're bidirectional?
Doesn't matter where you start-- either way you need the entire hardcoded skip logic, not just a portion of it.
Make sure to keep track of visited so no duplicates
You start with the number itself, then do (1..9), so you start length at 1
Skip if at number going to next number, and there's a middle value and it hasn't been visited yet
=end
```
