def is_valid_bst(root)
  return true unless root

  dfs = lambda do |node, min, max|
    return true unless node
    return false unless node.val > min && node.val < max

    dfs.call(node.left, min, node.val) && dfs.call(node.right, node.val, max)
  end
  dfs.call(root, -Float::INFINITY, Float::INFINITY)
end
