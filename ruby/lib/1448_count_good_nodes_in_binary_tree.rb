def good_nodes(root)
  good_node_count = 0
  dfs = lambda do |node, greatest|
    return unless node

    good_node_count += 1 if node.val >= greatest
    dfs.call(node.left, [node.val, greatest].max)
    dfs.call(node.right, [node.val, greatest].max)
  end
  dfs.call(root, root.val)
  good_node_count
end
