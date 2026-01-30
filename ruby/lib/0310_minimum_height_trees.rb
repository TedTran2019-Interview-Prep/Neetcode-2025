# frozen_string_literal: true

def find_min_height_trees(n, edges)
  return [0] if edges.empty?

  graph = Hash.new { |h, k| h[k] = [] }
  edges.each do |a, b|
    graph[a] << b
    graph[b] << a
  end

  edge_count = {}
  leaves = []
  graph.each do |node, neighbors|
    edge_count[node] = neighbors.length
    leaves << node if neighbors.length == 1
  end

  until leaves.empty?
    return leaves if n <= 2

    new_leaves = []
    leaves.each do |leaf|
      n -= 1
      graph[leaf].each do |neighbor|
        edge_count[neighbor] -= 1
        new_leaves << neighbor if edge_count[neighbor] == 1
      end
    end
    leaves = new_leaves
  end
end

# Naive times out on 55/71
def find_min_height_trees(n, edges)
  graph = Hash.new { |h, k| h[k] = [] }
  edges.each do |a, b|
    graph[a] << b
    graph[b] << a
  end

  dfs = lambda do |node, visited|
    return 0 if node.nil?
    return 0 if visited.include?(node)

    visited << node
    max = 0
    graph[node].each do |child|
      path = dfs.call(child, visited)
      max = [path, max].max
    end
    1 + max
  end

  min_height = Float::INFINITY
  result = []
  n.times do |node|
    height = dfs.call(node, Set.new)
    if height < min_height
      min_height = height
      result = [node]
    elsif height == min_height
      result << node
    end
  end
  result
end
