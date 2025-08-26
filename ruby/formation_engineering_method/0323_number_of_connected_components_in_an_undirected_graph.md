```ruby
=begin
Undirected graph with n nodes
edges array, edge[i] = [a, b]
nodes numbered from 0 to n - 1
total number of connected components

union find is most efficient way to find # of connected components
everything with a connected edge (even through other edges) is connected

One way: DFS search and check if visited/not visited

More efficient: How to union find?
Tree-like data structure
- Parent array, each node is a parent of tree
- Connect nodes, decrement number of nodes
- Maintain node rank
  - Used to merge smaller to bigger
Each union operation = minus number of components

create parent array (at each index, who is parent?)
create rank array (size of tree)
set components value to number of nodes

create find
    result = node
    until result == parent[result] (reached root)
        set parents[result] to parents[parents[result]] aka its grandfather
        set result to its grandfather
    return result

create union
    uses find to find root of a/b
    return 0 if root of a == root of b
    otherwise, connect smaller tree to bigger
        set parent of smaller tree to bigger
        add to rank of bigger tree the rank of smaller tree
    return 1

go through edges (a, b)
  components - result of union
return number of components
=end
```
