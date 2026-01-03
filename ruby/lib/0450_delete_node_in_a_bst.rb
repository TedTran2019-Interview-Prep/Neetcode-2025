# frozen_string_literal: true

# Cleaned up approach using dummy node
def delete_node(root, key)
  dummy = TreeNode.new(Float::INFINITY, root, nil)
  displaced_node = nil
  dfs = lambda do |node|
    return unless node

    if node.val == key
      if node.left && node.right
        displaced_node = node.left
        node.right
      else
        node.left || node.right
      end
    else
      node.left = dfs.call(node.left)
      node.right = dfs.call(node.right)
      node
    end
  end

  insert = lambda do |node|
    return displaced_node unless node

    if displaced_node.val > node.val
      node.right = insert.call(node.right)
    else
      node.left = insert.call(node.left)
    end
    node
  end

  dfs.call(dummy)
  insert.call(dummy) if displaced_node
  dummy.left
end

# Messier approach
def delete_node(root, key)
  return nil if root.nil? || (root.left.nil? && root.right.nil? && root.val == key)

  displaced_node = nil
  dfs = lambda do |node|
    return unless node

    if node.val == key
      if node.left && node.right
        displaced_node = node.left
        root = node.right if root == node
        return node.right
      elsif node.left
        root = node.left if root == node
        return node.left
      elsif node.right
        root = node.right if root == node
        return node.right
      else
        return nil
      end
    else
      node.left = dfs.call(node.left)
      node.right = dfs.call(node.right)
    end
    node
  end

  insert = lambda do |node|
    return displaced_node unless node

    if displaced_node.val > node.val
      node.right = insert.call(node.right)
    else
      node.left = insert.call(node.left)
    end
    node
  end

  dfs.call(root)
  insert.call(root) if displaced_node
  root
end
