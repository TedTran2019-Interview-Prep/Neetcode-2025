def is_balanced(root)
  height_balanced = true
  dfs = lambda do |node|
    return 0 unless node

    left_height = dfs.call(node.left)
    right_height = dfs.call(node.right)
    height_balanced = false unless (left_height - right_height).abs <= 1

    1 + [left_height, right_height].max
  end
  dfs.call(root)
  height_balanced
end

# Solution that doesn't utilize an outside variable and returns early
def is_balanced(root)
  dfs = lambda do |node|
    return [0, true] unless node

    left_height, left_balanced = dfs.call(node.left)
    return [0, false] unless left_balanced

    right_height, right_balanced = dfs.call(node.right)
    return [0, false] unless right_balanced

    max_height = [left_height, right_height].max
    balanced = (left_height - right_height).abs <= 1
    [max_height + 1, balanced]
  end
  dfs.call(root)[1]
end
