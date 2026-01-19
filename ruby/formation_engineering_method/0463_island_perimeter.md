```ruby
=begin
rowxcol grid where 1 is land, 0 is water
connected horiz/ver, NOT diag
completely surrounded by water
exactly 1 island
no lakes
determine perimeter of the island
how to determine perimeter?
for each square, if it's next by water/edge of map, +1 to perimeter size
that's it
flood fill outwards while tallying up perimeter size
=end
```
