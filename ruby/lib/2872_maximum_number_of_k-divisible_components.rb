# frozen_string_literal: true

def max_k_divisible_components(n, edges, values, k)
  graph = Hash.new { |h, k| h[k] = [] }
  edges.each do |a, b|
    graph[a] << b
    graph[b] << a
  end
  components = 0
  visited = Set.new
  dfs = lambda do |node, parent|
    return 0 if visited.include?(node)

    visited << node
    graph[node].each { |child| dfs.call(child, node) }

    if (values[node] % k).zero?
      components += 1
    else
      values[parent] += values[node]
    end
  end
  dfs.call(0, nil)
  components
end
