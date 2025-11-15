# frozen_string_literal: true

def min_cost_connect_points(points)
  edges = Hash.new { |h, k| h[k] = [] }
  (0...(points.length - 1)).each do |y|
    x1, y1 = points[y]
    ((y + 1)...points.length).each do |x|
      x2, y2 = points[x]
      manhattan_distance = (x1 - x2).abs + (y1 - y2).abs
      edges[y] << [x, manhattan_distance]
      edges[x] << [y, manhattan_distance]
    end
  end

  min_heap = Heap.new { |a, b| a[1] < b[1] } # point, manhattan distance (edge)
  min_heap << [0, 0]
  minimum_cost = 0
  visited = Set.new
  until visited.length == points.length
    node_index, edge = min_heap.pop
    next if visited.include?(node_index)

    visited << node_index
    minimum_cost += edge
    edges[node_index].each do |next_node|
      next if visited.include?(next_node[0])

      min_heap << next_node
    end
  end
  minimum_cost
end

# Utilizing coordinates intead of indexes (fails test case 71/72)
def min_cost_connect_points(points)
  edges = Hash.new { |h, k| h[k] = [] }
  (0...(points.length - 1)).each do |y|
    x1, y1 = points[y]
    ((y + 1)...points.length).each do |x|
      x2, y2 = points[x]
      manhattan_distance = (x1 - x2).abs + (y1 - y2).abs
      edges[points[y]] << [points[x], manhattan_distance]
      edges[points[x]] << [points[y], manhattan_distance]
    end
  end

  min_heap = Heap.new { |a, b| a[1] < b[1] } # point, manhattan distance (edge)
  min_heap << [points.first, 0]
  minimum_cost = 0
  visited = Set.new
  until visited.length == points.length
    node, edge = min_heap.pop
    next if visited.include?(node)

    visited << node
    minimum_cost += edge
    edges[node].each do |next_edge|
      next if visited.include?(next_edge[0])

      min_heap << next_edge
    end
  end
  minimum_cost
end
