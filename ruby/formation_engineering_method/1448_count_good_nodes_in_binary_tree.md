```ruby
=begin
Given root
Node X is good if within path from root to X, there are no nodes with a value greater than X
E.g, is this node greater than all nodes preceding it?
Do DFS, but keep track of greatest value seen so far for
each path. If a node has a greater value, it's a "good node".
Count the total number of good nodes
=end
```
