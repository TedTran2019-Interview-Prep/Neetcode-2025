# Return level order traversal of nodes
# Aka do BFS and store every queue's set of values
def level_order(root)
  return [] unless root

  level_order = []
  queue = [root]
  until queue.empty?
    new_queue = []
    level = []
    queue.each do |node|
      level << node.val
      new_queue << node.left if node.left
      new_queue << node.right if node.right
    end
    level_order << level
    queue = new_queue
  end
  level_order
end
