# DFS solution
def preorder_traversal(root)
  result = []

  dfs = lambda do |node|
    return unless node

    result << node.val
    dfs.call(node.left) if node.left
    dfs.call(node.right) if node.right
  end

  dfs.call(root)
  result
end

# Redo
def preorder_traversal(root)
  traversal = []
  dfs = lambda do |node|
    return nil unless node

    traversal << node.val
    dfs.call(node.left)
    dfs.call(node.right)
  end
  dfs.call(root)
  traversal
end

# Preorder traversal but using iteration
def preorder_traversal(root)
  stack = []
  result = []
  stack << root if root
  until stack.empty?
    node = stack.pop
    result << node.val
    stack << node.right if node.right
    stack << node.left if node.left
  end
  result
end
