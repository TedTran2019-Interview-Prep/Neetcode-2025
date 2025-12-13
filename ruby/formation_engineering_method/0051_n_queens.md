```ruby
=begin
At each row, place a queen (try every column)
Just need to check and see if valid placement
No queens in any 8 dirs upon placement-- what's a better way then stepping through all 8 dirs from the queen?

Row can be skipped (you won't place on the same row again)
Put col in hashmap (col)
Put forward diagonal in hashmap (row - col)
Put reverse diagonal in hashmap (row + col)
y, x
[1, 1] -> 0
[2, 2] -> (0, 4)
[3, 3] -> 0
[1, 3] -> 4
[3, 1] -> 4
(3 - 2).abs == (1 - 2).abs
=end
```

```ruby
=begin
n queens on nxn chessboard so no two queens can attack each other
Given n, return all distinct solutions to n-queens
'Q' is queen, '.' is empty space
Q Q Q Q
. . . .
. . . .
Brute force: use backtracking to attempt every configuration, if successful.... +
How to check if successful? From every single queen, make sure it can't touch any other queens in any direction.

make a method to check if a queen can touch any other queen in a dir
for all 8 dirs, call the method, return false if any
check all queens with the above method
on the board, check all combinations thru backtracking


how to backtrack?
n queens...
find every space possible to fill n queens, when all n queens filled, save board state and keep going
let's have DIRS start with [0, -1] for early exit
E.g, start with some sort of row/col
Iterate through the board, attempting to place queens
If you can place every single queen, save board state! Otherwise, RIP
=end
```
