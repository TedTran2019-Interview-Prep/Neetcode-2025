```ruby
=begin
n queens on nxn board such that no two queens can attack each other
given n, return number of distinct solutions to n-queens puzzle

n = 5: 5x5 board with 5 queens
For every row, place a queen in that column (cuz once you place in a row it's invalid for other queens)
See if column and diagonals are safe
If safe, place again and move onto next
When # queens == n, add +1 to solutions and move on
Meaning 1 queen per row

diag: row + col
inverted diag: row - col
=end
```
