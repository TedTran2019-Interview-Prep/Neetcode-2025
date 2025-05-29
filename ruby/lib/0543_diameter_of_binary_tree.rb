def diameter_of_binary_tree(root)
  diameter_max = 0
  dfs = lambda do |node|
    return 0 unless node

    left = dfs.call(node.left)
    right = dfs.call(node.right)

    diameter = left + right
    diameter_max = [diameter, diameter_max].max
    [left, right].max + 1
  end
  dfs.call(root)
  diameter_max
end
