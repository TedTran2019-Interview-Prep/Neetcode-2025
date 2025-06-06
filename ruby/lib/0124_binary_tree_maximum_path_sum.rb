def max_path_sum(root)
  max_sum = root.val
  dfs = lambda do |node|
    return 0 unless node

    left = [dfs.call(node.left), 0].max
    right = [dfs.call(node.right), 0].max

    sum = left + right + node.val
    max_sum = [sum, max_sum].max

    node.val + [left, right].max
  end

  dfs.call(root)
  max_sum
end

def max_path_sum(root)
  max_sum = root.val
  dfs = lambda do |node|
    return 0 unless node

    left = dfs.call(node.left)
    right = dfs.call(node.right)
    left = 0 if left.negative?
    right = 0 if right.negative?

    sum = left + right + node.val
    max_sum = [sum, max_sum].max

    [left + node.val, right + node.val].max
  end

  dfs.call(root)
  max_sum
end
