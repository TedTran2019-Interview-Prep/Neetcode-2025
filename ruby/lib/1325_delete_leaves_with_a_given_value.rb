# frozen_string_literal: true

def remove_leaf_nodes(root, target)
  return nil unless root

  root.left = remove_leaf_nodes(root.left, target)
  root.right = remove_leaf_nodes(root.right, target)
  return nil if root.left.nil? && root.right.nil? && target == root.val

  root
end
