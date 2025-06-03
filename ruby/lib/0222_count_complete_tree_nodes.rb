def count_nodes(root)
  return 0 unless root

  left_depth = 0
  right_depth = 0
  left = root
  right = root
  while left
    left = left.left
    left_depth += 1
  end
  while right
    right = right.right
    right_depth += 1
  end

  return (2**left_depth - 1) if left_depth == right_depth

  1 + count_nodes(root.left) + count_nodes(root.right)
end
