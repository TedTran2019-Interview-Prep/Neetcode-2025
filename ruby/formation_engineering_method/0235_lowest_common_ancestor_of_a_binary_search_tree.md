```ruby
=begin
find LCA of two given nodes
If node == p or q, that's the LCA
BST, so all nodes to left smaller, all to right bigger
If both goes towards left/right, go in that direction
If it's a split, that node is the LCA
So == or split is LCA, otherwise keep traveling

return nil unless node
if root == p or q, return root
if both p and q smaller than root
    call lca on root.left, p, q
elsif both p and q bigger than root
    call lca on root.right, p, q
else
    return root
=end
```
