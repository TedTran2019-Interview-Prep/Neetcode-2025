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

# Iterative postorder
def postorder_traversal(root)
  stack = []
  stack << root if root
  visited = Set.new
  traversal = []
  until stack.empty?
    curr = stack.pop

    if visited.include?(curr)
      traversal << curr.val
    else
      stack << curr
      visited << curr
      stack << curr.right if curr.right
      stack << curr.left if curr.left
    end
  end
  traversal
end

# Iterative postorder w/ a clever trick
def postorder_traversal(root)
  stack = []
  stack << root if root
  traversal = []
  until stack.empty?
    curr = stack.pop
    traversal << curr.val
    stack << curr.left if curr.left
    stack << curr.right if curr.right
  end
  traversal.reverse
end
