```ruby
=begin
heights, 2d rows x cols
situated at (0, 0)
travel to bottom-right (rows - 1, cols - 1) aka y, x
Can move up/down/left/right, find minimum effort route
effort = maximum absolute diff in heights btwn two cells
minimum effort to go top-left to bottom-right

So if you go [1, 3, 5, 3, 5] max diff is 2 (This is better)
If you go [1, 2, 2, 2, 5] max diff is 3...

Isn't this just Dijkstra's?
Start at 1
Try going to 2/3, store max abs value of diff and put back into heap
Rinse and repeat... make sure you have a visited to not repeat
=end
```
