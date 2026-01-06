# frozen_string_literal: true

# Neetcode's clever approach
def rob(root)
  dfs = lambda do |node|
    return [0, 0] unless node

    left = dfs.call(node.left)
    right = dfs.call(node.right)
    # with_node can't take immediate with_nodes as children (directly-linked)
    with_node = node.val + left[1] + right[1]
    # without_node can choose to take any child that gives greatest value
    without_node = left.max + right.max
    [with_node, without_node]
  end
  dfs.call(root).max
end

# Caching approach
def rob(root)
  cache = {}
  dfs = lambda do |node, skip|
    return 0 unless node

    key = [node, skip]
    return cache[key] if cache.key?(key)

    left = dfs.call(node.left, false)
    right = dfs.call(node.right, false)
    total = left + right
    unless skip
      left_take = dfs.call(node.left, true)
      right_take = dfs.call(node.right, true)
      total_take = left_take + right_take + node.val
      total = total_take if total_take > total
    end

    cache[key] = total
  end
  dfs.call(root, false)
end

# No caching approach fails on 122/124 timeout
def rob(root)
  dfs = lambda do |node, skip|
    return 0 unless node

    left = dfs.call(node.left, false)
    right = dfs.call(node.right, false)
    total = left + right
    unless skip
      left_take = dfs.call(node.left, true)
      right_take = dfs.call(node.right, true)
      total_take = left_take + right_take + node.val
      total = total_take if total_take > total
    end

    total
  end
  dfs.call(root, false)
end
