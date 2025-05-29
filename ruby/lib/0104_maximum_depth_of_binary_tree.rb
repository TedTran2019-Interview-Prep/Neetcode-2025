# One liner variant
def max_depth(root)
  return 0 unless root

  1 + [max_depth(root.left), max_depth(root.right)].max
end

def max_depth(root)
  max = 0

  dfs = lambda do |node, level|
    return nil unless node

    max = [max, level].max
    dfs.call(node.left, level + 1) if node.left
    dfs.call(node.right, level + 1) if node.right
  end

  dfs.call(root, 1)
  max
end
