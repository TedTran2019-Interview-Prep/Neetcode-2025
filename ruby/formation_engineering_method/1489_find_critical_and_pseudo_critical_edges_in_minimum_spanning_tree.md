```ruby
=begin
weighted undirected connected graph
n vertices from 0 to n-1
edges[i] = [a, b, weight]
MST: minimum spanning tree
- subset of graph's edges that connect all vertices without cycles with minimum possible total edge weight

find all critical and pseudo-critical edges in the graph's MST
- aka edge whose deletion would cause MST weight to increase is a critical edge
- pseudo-critical edge is one that can appear in some MSTs but not all

critical: show up in all MSTS
pseudo-critical: show up in some MSTS

Naive:
Find all MSTs
Go through all MSTS
- Track occurrence of edges
- If less than MST count, it's pseudo-critical else critical?

How does one find all MSTs?
Prims: BFS with min heap, just add unvisited min cost neighbors until all visited
Problem: 0-3, 0-2, 0-4, 3-4 all have same weights
Every time there's a "collision" aka same weights, need to branch...

Misunderstood the problem:
We're not tracking vertices, but edges, so we're looking at indexes.
This is actually way easier than I thought
If when using Prim's, there's NO branch, it's a critical edge.
If when using Prim's, there is a branch, it's a pseudo-critical edge.
IF it's never used in the first place, it's neither.
Keep track of the edge's index that connects a/b and it's weight!
That's it.

Issue: this solution doesn't deal with the case when all edges have equal weight
Prim's was the wrong choice here... if I could add all edges to the heap at once and process, I could deal with that situation
Need to use Kruskal's instead? (Union find is needed to see, "are these two nodes already connected, even indirectly?")
Work on this tomorrow-- today was for reviewing Prim's and learning the problem
Tomorrow will be for solving it/learning Kruskal's algorithm and also reviewing union find
=end
```
