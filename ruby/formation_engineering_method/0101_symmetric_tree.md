```ruby
=begin
Check if a binary tree is a mirror of itself
For each subtree, check if left == right when mirrored

return true unless root

dfs = lambda do |left, right|
    return true if left and right doesn't exist
    return false if left exists but right doesn't and vice versa
    return false unless left doesn't equal to right

    call dfs on left(left.left, right.right)
    call dfs on right(left.right, right.left)

    left sub && right sub

dfs.call(root.left, root.right)
=end
```
