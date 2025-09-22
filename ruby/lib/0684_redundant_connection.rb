# frozen_string_literal: true

# @param {Integer[][]} edges
# @return {Integer[]}
def find_redundant_connection(edges)
  parents = (0..edges.length).to_a
  rank = Array.new(parents.length) { 1 }

  find = lambda do |node|
    result = node
    until result == parents[result]
      parents[result] = parents[parents[result]]
      result = parents[result]
    end
    result
  end

  union = lambda do |a, b|
    parent_a = find.call(a)
    parent_b = find.call(b)
    return false if parent_a == parent_b

    if rank[parent_a] >= rank[parent_b]
      parents[parent_b] = parent_a
      rank[parent_a] += rank[parent_b]
    else
      parents[parent_a] = parent_b
      rank[parent_b] += rank[parent_a]
    end
    true
  end

  edges.each do |edge|
    result = union.call(*edge)
    return edge unless result
  end
end
