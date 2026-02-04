# frozen_string_literal: true

# Attempted solution utilizing Prim's that did not work at all
def find_critical_and_pseudo_critical_edges(n, edges)
  graph = Hash.new { |h, k| h[k] = [] }
  edges.each_with_index do |edge, idx|
    a, b, weight = edge
    graph[a] << [b, weight, idx]
    graph[b] << [a, weight, idx]
  end
  critical = []
  pseudo_critical = []
  visited = Set.new
  # Ensure heap is sorted by weight then node just to ensure same nodes are next by each other
  # Node to travel to, weight, index of edge
  min_heap = Heap.new { |a, b| a[1] == b[1] ? a[0] < b[0] : a[1] < b[1] }
  graph[0].each { |info| min_heap << info }
  visited << 0
  n -= 1
  until n.zero?
    node, weight, idx = min_heap.pop
    collision = false
    while !min_heap.empty? && (min_heap.peek[0] == node && min_heap.peek[1] == weight)
      pseudo_critical << idx
      node, weight, idx = min_heap.pop
      collision = true
    end
    visited << node
    n -= 1
    collision ? pseudo_critical << idx : critical << idx
    graph[node].each do |info|
      next if visited.include?(info[0]) # Destination

      min_heap << info
    end
  end
  [critical, pseudo_critical]
end
