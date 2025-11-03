# frozen_string_literal: true

def build_tree(preorder, inorder)
  return if preorder.empty? || inorder.empty?

  root = TreeNode.new(preorder.first)
  mid = inorder.index(preorder.first)
  root.left = build_tree(preorder[1..mid], inorder[0...mid])
  root.right = build_tree(preorder[mid + 1..], inorder[mid + 1..])
  root
end
