```ruby
=begin
undirected graph
two vertices are connected by exactly 1 path aka no cycles
n nodes (0 to n - 1)
n - 1 edges, [a, b] == undirected edge
can choose any node as root
node x as root, height h
minimum height == minimum height trees
return list of all MHT root labels

Naive:
Go through every single node
DFS and find height
Return all nodes with minimum height
Naive times out on 55/71

NC solution:
Think backwards: eliminate all leaves
At most, 2 roots
=end
```
