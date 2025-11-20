```ruby
=begin
nxm grid, grid[i][j] represents elevation
At time t, water level is t == any cell with less/equal to t is reachable
can swim to any other 4-directionally adjacent square if elevation of both are individually at most t
can swim infinite distances in 0 time (must stay within boundaries of grid)
minimum time to reach bottom right if start at top left

Don't have to visit every node, so not Hierholzer's Eulerian path
Not Prim's, not looking to connect all vertices w/ minimum edge weight

Wouldn't similar to Dijkstra's be able to solve this? (Without adding path values)
Aka lowest maximum time to reach the final node
Start at (0, 0)
Can go right/down
Add t=1, t=2 to the heap
With 1 you can go right, t=3
With 2, you can down, t=3
Once you hit t=3 aka bottom right, that's the minimum for reaching that point
Just make sure not to hit visited nodes again
=end
```
