```ruby
=begin
m*n 2d grid with three possible values:
1. -1 (can't be traversed)
2. 0 (treasure)
3. INF (land can be traversed), 2147483647 to represent INF
Modify grid in-place
Fill each land cell with distance to nearest treasure chest

Brute force:
For each treasure chest, BFS outwards
- If it's a land cell (can move), otherwise can't
- If BFS's value is less than land cell's current value, change it
Repeat until you've BFS'd out from every treasure chest

Optimal:
- BFS from each treasure chest SIMULTANEOUSLY
- If already visited, don't go there!
- Visited == not infinity, dont' even need a visit map

Issue I ran into: marking the grid at the wrong time (mark early so nodes aren't enqueued multiple
times!!!)
=end
```
