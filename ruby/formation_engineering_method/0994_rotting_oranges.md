```ruby
=begin
m*n grid
0: empty
1: fresh orange
2: rotten orange
Any fresh orange next by a rotten orange becomes rotten!
How many minutes til' all rotten? (Or -1 if impossible)
Multi-BFS outwards from all rotten oranges!
Once finish spreading and queue is empty
- If any fresh oranges left, return -1
- IF no fresh oranges left, return turns
=end
```
