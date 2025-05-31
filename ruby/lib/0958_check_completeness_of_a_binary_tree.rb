# Using a flag for code clarity
def is_complete_tree(root)
  return true unless root

  queue = Queue.new
  queue << root
  seen_nil = false
  until queue.empty?
    node = queue.shift
    if node.nil?
      seen_nil = true
    else
      return false if seen_nil

      queue << node.left
      queue << node.right
    end
  end

  true
end

def is_complete_tree(root)
  return true unless root

  queue = [root]
  until queue.empty?
    node = queue.shift
    return false if node.nil? && !queue[0].nil?
    next if node.nil?

    queue << node.left
    queue << node.right
  end

  true
end
