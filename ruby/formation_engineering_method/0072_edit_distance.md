```ruby
=begin
word1 and word2, return minimum # of ops to convert word1 to word2
3 ops:
Insert a char
Delete a char
Replace a character

Naive:
intention (starts with 4 characters matching aka tion in right place)
inteution 1
enteution 2
exteution 3
exeution 4 (Basically deleting to get chars in place is cheaper than just replacing...)
execution 5

Insertion can cause infinite loops...
You can also get into an endless remove -> insert loop...
Replace is a basic operation: at most it can put 1 character into place
Both insert and delete can put many characters into place by shifting many parts of the string
You need the RIGHT character in the RIGHT index...

Simple cases:
two empty strings, two identical strings - no action needed
B empty, need to delete everything from A (delete A.length times)
A empty, need to insert everything from B (insert B.length times)

How do we convert into subproblems?
If identical, can move both pointers forward
ELSE, insert/delete/replace
replace: (match it, move both pointers forward)
insert: (insert a match, move B pointer forward, keep A where it is)
delete: (move A pointer forward, keep B where it is)

2D DP: think base cases
go right -> insert
go down -> delete
go diagonal -> replacing
choose min of these 3
if not matching, choose min of the 3 actions + 1 (cost of taking an action)
if matching, set current to be the diagonal
=end
```
