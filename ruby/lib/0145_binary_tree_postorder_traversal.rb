# frozen_string_literal: true

def postorder_traversal(root)
  traversal = []
  dfs = lambda do |node|
    return nil unless node

    dfs.call(node.left)
    dfs.call(node.right)
    traversal << node.val
  end
  dfs.call(root)
  traversal
end
