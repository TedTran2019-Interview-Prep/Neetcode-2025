```ruby
=begin
Binary tree root and integer target
Delete all leaf nodes w/ value target
Once a leaf node has been deleted, its parent nodes become a leaf and must be deleted if it's target

To "delete" a leaf node is just making sure it has no children
Then setting its parent to nil
This can be recursive to make its parent have no children, and so on (so post-order processing)
=end
```
