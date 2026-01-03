# frozen_string_literal: true

def insert_into_bst(root, val)
  return TreeNode.new(val) if root.nil?

  if val > root.val
    root.right = insert_into_bst(root.right, val)
  else
    root.left = insert_into_bst(root.left, val)
  end
  root
end

def insert_into_bst(root, val)
  new_node = TreeNode.new(val)

  dfs = lambda do |node|
    return new_node unless node

    if val > node.val
      node.right = dfs.call(node.right)
    else
      node.left = dfs.call(node.left)
    end
    node
  end
  dfs.call(root)
  root || new_node
end
