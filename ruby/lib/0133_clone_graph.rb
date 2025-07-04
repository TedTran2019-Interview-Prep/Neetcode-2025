# frozen_string_literal: true

def cloneGraph(node)
  return nil unless node

  clone_map = {}
  clone = lambda do |node|
    return clone_map[node] if clone_map[node]

    new_node = Node.new(node.val)
    clone_map[node] = new_node
    node.neighbors.each do |neighbor|
      new_node.neighbors << clone.call(neighbor)
    end
    new_node
  end
  clone.call(node)
end

def cloneGraph(node)
  clone_map = {}
  queue = []
  queue << node if node
  until queue.empty?
    new_queue = []
    queue.each do |current_node|
      next if clone_map[current_node.object_id]

      new_node = Node.new(current_node.val)
      clone_map[current_node.object_id] = new_node
      new_queue.concat(current_node.neighbors)
    end
    queue = new_queue
  end

  queue = []
  queue << node if node
  visited = Set.new
  until queue.empty?
    new_queue = []
    queue.each do |current_node|
      next if visited.include?(current_node)

      visited << current_node
      new_queue.concat(current_node.neighbors)
      new_node = clone_map[current_node.object_id]
      current_node.neighbors.each do |neighbor|
        new_node.neighbors << clone_map[neighbor.object_id]
      end
    end
    queue = new_queue
  end

  clone_map[node.object_id]
end
