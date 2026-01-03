# frozen_string_literal: true

def inorder_traversal(root)
  traversal = []
  dfs = lambda do |node|
    return nil unless node

    dfs.call(node.left)
    traversal << node.val
    dfs.call(node.right)
  end
  dfs.call(root)
  traversal
end
