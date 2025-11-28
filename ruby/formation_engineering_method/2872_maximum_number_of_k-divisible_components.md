```ruby
=begin
undirected tree n nodes 0 to n - 1
n, 2D array edges of length n - 1
edges[i] = [a, b]
0-indexed int array values of length n
values[i] associated with ith node and integer k
valid split = remove any set of edges so that all components are divisible by k

naive:
split the tree in every way possible
valid if all components are divisible by k
return max components

better:
start from leaf nodes
if leaf node divisible by k, cut it off
else merge it into parent

start at components == 0 to keep recursion consistent

how do I get to leaf nodes?
start from any node and DFS
once no more children or children processed, confirm LEAF
    +=1 if divisible by k else += 0 and add value to upper component
    mark visited, don't go there again

wait but it's undirected, how do you know what a parent even is?
how do we add value to upper components?
it's a tree, so everything is confirmed to be connected and there are no cycles
so it doesn't matter, just call it on a single node
=end
```
