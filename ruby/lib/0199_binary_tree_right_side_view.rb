# BFS once again
# But only last value of every level
def right_side_view(root)
  return [] unless root

  queue = [root]
  right_side = []
  until queue.empty?
    new_queue = []
    right_side << queue[-1].val
    queue.each do |node|
      new_queue << node.left if node.left
      new_queue << node.right if node.right
    end
    queue = new_queue
  end

  right_side
end
