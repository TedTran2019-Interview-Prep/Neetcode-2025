```ruby
=begin
root of BST
Determine if it's a valid BST
All left nodes are less
All right nodes are greater than
Both left/right must be BSTs

For root, it's valid if it's between -infinity, infinity
For left tree, it has to be  -infinity(prev min), prev node val
For right tree, it has to be prev node val, infinity

return true unless root
dfs = lambda do |node, min, max|
    return true unless node
    return false unless node is within min, max EXCLUSIVE

    dfs.call(node.left, min, node.val)
    AND
    dfs.call(node.right, node.val, max)

dfs.call(root, neg infinity, infinity)
=end
```
