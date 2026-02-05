# frozen_string_literal: true

# Solution utilizing Kruskal's
def find_critical_and_pseudo_critical_edges(n, edges)
  edges.each_with_index { |edge, idx| edge << idx }
  edges.sort_by! { |edge| edge[2] }
  critical = []
  pseudo_critical = []
  uf = UnionFind.new(n)
  mst_weight = 0
  edges.each { |a, b, weight, _idx| mst_weight += weight if uf.union(a, b) }
  edges.each do |a, b, edge_weight, edge_idx|
    # Try seeing if MST can exist without this edge
    uf = UnionFind.new(n)
    current_mst_weight = 0
    edges.each do |v1, v2, weight, idx|
      next if idx == edge_idx

      current_mst_weight += weight if uf.union(v1, v2)
    end
    # If cannot exist without this edge, it's critical
    if uf.size.max != n || current_mst_weight > mst_weight
      critical << edge_idx
      next
    end

    # Else, try seeing if MST can exist with this edge
    uf = UnionFind.new(n)
    current_mst_weight = 0
    uf.union(a, b)
    current_mst_weight += edge_weight
    edges.each do |v1, v2, weight, idx|
      next if idx == edge_idx

      current_mst_weight += weight if uf.union(v1, v2)
    end
    pseudo_critical << edge_idx if current_mst_weight == mst_weight
  end
  [critical, pseudo_critical]
end

# Coded Union Find on the spot
class UnionFind
  attr_accessor :parents, :size

  def initialize(size)
    @parents = (0...size).to_a
    @size = Array.new(size, 1)
  end

  def find(node)
    until node == @parents[node]
      @parents[node] = @parents[@parents[node]]
      node = @parents[node]
    end
    node
  end

  def union(node1, node2)
    root1 = find(node1)
    root2 = find(node2)
    return false if root1 == root2

    if @size[root1] > @size[root2]
      @size[root1] += @size[root2]
      @parents[root2] = root1
    else
      @size[root2] += @size[root1]
      @parents[root1] = root2
    end
  end
end

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
