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

# Iteration
def inorder_traversal(root)
  traversal = []
  stack = []
  stack << root if root
  until stack.empty?
    curr = stack.pop
    while curr.left
      stack << curr
      curr = curr.left
    end
    until stack.empty? || curr.right
      traversal << curr.val
      curr = stack.pop
    end
    traversal << curr.val
    stack << curr.right if curr.right
  end
  traversal
end

# Iteration NC way
def inorder_traversal(root)
  traversal = []
  stack = []
  curr = root
  while !stack.empty? || curr
    # Travel left
    while curr
      stack << curr
      curr = curr.left
    end
    # Process node
    curr = stack.pop
    traversal << curr.val
    # Set current to right node if it exists
    curr = curr.right
  end
  traversal
end
