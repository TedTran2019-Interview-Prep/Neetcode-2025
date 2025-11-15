```ruby
=begin
points: int coors on a 2D plane [x, y]
cost of connecting points is manhattan distance (absolute value of x1 - x2 + absolute value of y1 - y2)
minimum cost to make all points connected (one simple path between any two points) - MST
Isn't this one also Dijkstra's? (IT'S NOT)

This problem is Prim's algorithm (Minimum spanning trees), (there's also Kruskal's algo)
edges = Manhattan distance between points
then just apply Prim's algorithm
very similar to Dijkstra's, uses min heap
n nodes = n - 1 edges to connect all with no cycle
minimize total cost of edges
BFS
- hash map to stop from adding same node twice
- min heap to keep track of frontier (every possible node that can be added from this position)
    - keep track of node + weight of adding it
    - keep connecting by minimum cost
- once set of visit nodes is equal to number of nodes, done!
Prim's:
start at any node
until size of visited == number of nodes
    pop from min heap
    continue if already visited
    add all neighbors to frontier (that aren't already visited)
    add to visit set
    add to cost
Basically problem is create edges then do Prim's
Extremely similar to Dijkstra's, honestly.
=end
```
