def is_symmetric(root)
  return true unless root

  dfs = lambda do |left, right|
    return true if !left && !right
    return false if !left || !right
    return false unless left.val == right.val

    left_sub = dfs.call(left.left, right.right)
    right_sub = dfs.call(left.right, right.left)

    left.val == right.val && left_sub && right_sub
  end

  dfs.call(root.left, root.right)
end
