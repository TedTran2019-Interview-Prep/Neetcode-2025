```ruby
=begin
Return # of nodes in tree for COMPLETE binary tree
Aka, all levels are filled except the last, to the left
Has to be less than O(N) time complexity

If it's a perfect complete binary tree, # of nodes is 2^N - 1. How do we know it's a perfect complete binary tree? Depth of going far left/far right is the same

If it's not... do said check again on left/right, and return 1 (current node) + (whatever left returns) + (whatever right returns). If it's a node by itself with no L/R, that's a perfect binary tree, so is no node, I guess.
=end
```
