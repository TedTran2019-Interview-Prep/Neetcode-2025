```ruby
=begin
Topological sort problem
From the example, think about why it's best represented as a graph....
wrt
wrf
er
ett
rftt
t comes before f
w comes before e
r becomes before t
e becomes before r
w -> e -> r > t -> f

DFS solution:
Cycles == no solution
Disconnected nodes = multiple solutions
Post-order DFS, then reverse
Topological sort = DFS but building result in reverse order

Think about edge cases
e.g w1 > w2 but last character is the same (invalid)

A major part of this problem is just constructing the graph in the first place, then applying
topological sort.

Kahn's algorithm to do topological sort (if want to do BFS)
Problems with dependencies and you need to determine valid order (like Course Schedule II)

Let's learn Kahn's despite not using it for this problem...
[Topological Sort (Kahn's algorithm)](https://www.youtube.com/watch?v=cIBFEhD77b4)
- O(V + E) time complexity
- Directed edges + Acyclic (no cycles)
- Intuition:
    - Repeatedly remove nodes w/o dependencies and add them to the ordering
        - As nodes (and their edges) are removed from graph, nodes lose dependencies and become free
        - Repeat removing nodes without dependencies until all nodes are processed or cycle discovered
- Count degrees (incoming edges)
- Queue w/ all nodes with no dependencies
    - Upon removing a node, decrease degree of all affected nodes
- So what do you need?
    - Degree count
    - Easy way to find node A leads to which nodes so you can easily decrease degree count
=end
```
