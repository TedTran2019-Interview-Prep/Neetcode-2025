```ruby
=begin
Given mxn integer matrix, if an element is 0, set all row/columns to 0
MUST BE DONE IN PLACE
NOT RECURSIVE (e.g setting a 0 doesn't create a chain of setting other 0s)

Go through the matrix
If you hit a 0, expand out column/row
Change 1 to -1, keep 0s as 0s
Rinse and repeat
At the very end, change all -1 to 0s
=end
```
