# Graphs

## Dijkstra

Problems:

- 0743 Network Delay Time

Purpose: finding shorted path between nodes in a weighted graph
More or less, it's just BFS with a min heap, keeping track of the cost of a path to reach a node.

## Prim's

Problems:

- 1584 Min Cost to Connect All Points

Purpose: find minimum spanning tree (connects all nodes with minimum edge weight)
BFS w/ min heap, keep adding unvisited minimum cost neighbors until all nodes visited
Works starting at any node!
(Similar to Dijkstra, BFS w/ min heap)

## Kruskal's

Purpose: find minimum spanning tree (like Prim's)
Sort list of edges by weight, then union. If fails (both nodes already connected) then don't add
edge, otherwise add it.

## Hierholzer

Problems:

- 0332 Reconstruct Itinerary

Purpose: find Eulerian path (visit every edge exactly once)
DFS, add node when no more outgoing edges (remove them), then reverse at end.
Aka building cycles by CONSUMING edges
(Very similar to topological sort utilizing DFS)

## Topological Sort (DFS)

Purpose: Topological sort
Postorder DFS then reverse.
Add node when all children visited, then reverse to find path to handle all dependencies.
Only works on DAGs.

## Kahn

Purpose: Topological sort using BFS

## Bellman-Ford

## Floyd-Warshall

Purpose: Shortest path between ALL pairs of vertices
V x V array of minimum distances (start out as infinity default values)
For each node, set its distance from itself to 0
Then go through the edges, filling out edge(a, b) = weight in the graph
Now a triply nested loop: 3x nodes.length.times: k, i, j

```ruby
if dist[i][j] > dist[i][k] + dist[k][j]
    dist[i][j] = dist[i][k] + dist[k][j]
```

k (outer loop) is an intermediate node
For every pair of vertices (i, j), can we find a shorter path by going through k?
Is it better to go directly from i to j, to go from i to k THEN k to j?
Cool DP algorithm!
