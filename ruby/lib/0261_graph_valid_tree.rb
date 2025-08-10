# frozen_string_literal: true

# Lintcode since it's a Leetcode premium problem
class Solution
  def valid_tree(n, edges)
    # Create the graph
    graph = Hash.new { |h, k| h[k] = [] }
    edges.each do |node1, node2|
      graph[node1] << node2
      graph[node2] << node1
    end

    visited = Set.new
    dfs = lambda do |prev, node|
      visited << node
      graph[node].each do |child|
        if visited.include?(child)
          return false if prev != child

          next
        end

        dfs.call(node, child)
      end
    end

    dfs.call(-1, 0)
    visited.size == n
  end
end
