```ruby
=begin
m*n rectangular island
Pacific touches left/top edges
Atlantic right/bottom edges
heights = height above sea level at coordinate
Rain flows to neighboring cells (4 dirs) if neighboring cell height is less/equal to current cell's height
Water can flow from any cell adjacent from ocean into ocean
Which cells can flow to both the Atlantic and Pacific oceans?

Idea:
- All first row and first col can flow into Pacific
- All bottom row and last col can flow into Atlantic
- Make a map going from edges downwards (Pacific) until can't continue
    - Skip already visited
- Make a map going from edges upwards (Atlantic) until can't continue
    - Skip already visited, of course!
- Make a Pacific Ocean map
- Make an Atlantic Ocean map
- Spread out from all ocean Pacific Ocean and Atlantic Ocean nodes, filling map and skipping already visited
- Done!
=end
```
