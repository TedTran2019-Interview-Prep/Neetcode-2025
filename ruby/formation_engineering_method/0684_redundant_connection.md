```ruby
=begin
undirected graph that is connected w/ no cycles
n nodes 1 to n
graph represented as an array of edges (a, b)
One additional edge is added (two diff vertices)
Last edge that can be removed to ensure graph is a tree
Basically remove the edge that causes the graph to be a cycle

Inefficient:
create the graph
last redundant connection = nil
go through list of edges
    remove edge from graph
    use cycle detection algorithm?
        If a node that has already been visited is visited again
        NOT including the last node visited
        ensure no nodes are disconnected
        means there's some sort of redundant connection
    set edge as last redundant connection if cycle NOT detected
    add edge back to graph
return last redundant connection

Better solution:
check if the edge is part of the cycle, if it is, it is the last redundant connection
Check from last edge to the first rather than overwriting result

Best solution:
Union find to detect cycles
For a tree: n nodes == n - 1 edges ALWAYS
Union find as you connect can tell you if two components are ALREADY CONNECTED

parents = (0..edges.length).to_a
rank = Array.new(parents.length) { 1 }

find = lambda do node
    result = node
    until result == parents[result]
        parents[result] = parents[parents[result]] # path compression
        result = parents[result]
    return result
union = lambda do |a, b|
    parent a = find.call(a)
    parent b = find.call(b)
    return false if parent a == parent b

    if rank[parent_a] >= rank[parent_b]
        parents[parent_b] = parent_a
        rank[parents_a] += rank[parents_b]
    else
        parents[parent_a] = parent_b
        rank[parents_b] += rank[parents_a]

    true

go through list of edges
    union a/b together
    if union fails because already connected, return that edge
=end
```
