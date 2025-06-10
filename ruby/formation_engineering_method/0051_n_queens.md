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
