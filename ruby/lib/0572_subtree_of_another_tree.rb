def is_subtree(root, sub_root)
  return true if sub_root.nil?
  return false unless root

  return true if root.val == sub_root.val && tree_match(root, sub_root)

  left = is_subtree(root.left, sub_root)
  right = is_subtree(root.right, sub_root)
  left || right
end

def tree_match(root, sub_root)
  return true if sub_root.nil? && root.nil?
  return false if root.nil? && sub_root
  return false if root && sub_root.nil?
  return false unless root.val == sub_root.val

  tree_match(root.left, sub_root.left) && tree_match(root.right, sub_root.right)
end

# Slightly cleaned up version, thanks ChatGPT
# def is_subtree(root, sub_root)
#   return true if sub_root.nil?
#   return false unless root
#   return true if tree_match(root, sub_root)

#   is_subtree(root.left, sub_root) || is_subtree(root.right, sub_root)
# end

# def tree_match(root, sub_root)
#   return true if sub_root.nil? && root.nil?
#   return false if sub_root.nil? || root.nil?
#   return false unless root.val == sub_root.val

#   tree_match(root.left, sub_root.left) && tree_match(root.right, sub_root.right)
# end
