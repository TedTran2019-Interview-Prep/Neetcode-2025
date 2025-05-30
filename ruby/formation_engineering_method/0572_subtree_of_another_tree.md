```ruby
# roots of two binary trees (root, subRoot)
# Return true if there is a subtree in root that's same as subRoot

# if root's val != subroot, try left/right
# When left/right match, call a function to check if subRoot is in root (EXACT MATCH)
# Return true if true is ever returned

# Plan:
#     return true if sub_root doesn't exist
#     return false if root doesn't exist

#     if root.val == sub_root.val
#         return true if rest of tree match
#     left = is_subtree(root.left, sub_root)
#     right = is_subtree(root.right, sub_root)

#     left || right

# def tree_match(root, sub root)
#     return true if both root and subroot are nil
#     return false if root && !subroot
#     return false if !root && subroot
#     return false unless root.val == sub_root.val
#     tree_match(root.left, sub_root.left) && tree_match(root.right, sub_root.right)
```
