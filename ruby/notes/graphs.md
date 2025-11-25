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

## Kahn

Purpose: Topological sort using BFS

## Bellman-Ford
