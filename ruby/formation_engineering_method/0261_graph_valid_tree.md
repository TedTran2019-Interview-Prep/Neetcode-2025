```ruby
=begin
n nodes labeled from 0 to n - 1
undirected edges (pair of nodes)
Check whether edges make up a valid tree
Vaild tree
- no looping back
- every node connected
Does an empty graph count as a tree? Yes!
Is 0 always the base of the tree? Yes!

Does number of node visited == number of nodes given?
Create graph
Traverse through graph
- return false if any visited nodes are visited again
- Return false if number of visited nodes doesn't equal to n
Keep track of prev so you don't backtrack (undirected edges)

Inspiration to solve this problem:
draw out the graph, know the properties of a tree, see in context of undirected edges
=end
```
