# algo to serialize/deserialize a binary tree
# serialize into string
# deserialized into original tree
#
# Pre-order traversal OR BFS (level-order)
# Let's do pre-order
def serialize(root)
  serialized = []
  dfs = lambda do |node|
    unless node
      serialized << 'nil'
      return
    end

    serialized << node.val
    dfs.call(node.left)
    dfs.call(node.right)
  end

  dfs.call(root)
  serialized.join(',')
end

def deserialize(data)
  data = data.split(',').map { |char| char == 'nil' ? nil : char.to_i }
  index = 0
  dfs = lambda do
    if data[index].nil?
      index += 1
      return nil
    end

    root = TreeNode.new(data[index])
    index += 1
    root.left = dfs.call
    root.right = dfs.call
    root
  end
  dfs.call
end
