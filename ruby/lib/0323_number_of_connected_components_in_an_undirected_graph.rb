# frozen_string_literal: true

def count_components(n, edges)
  parents = (0...n).to_a
  rank = Array.new(n, 1)

  find = lambda do |node|
    result = node
    while result != parents[result]
      parents[result] = parents[parents[result]]
      result = parents[result]
    end
    result
  end

  union = lambda do |a, b|
    parent1 = find.call(a)
    parent2 = find.call(b)
    return 0 if parent1 == parent2

    if rank[parent1] > rank[parent2]
      parents[parent2] = parent1
      rank[parent1] += rank[parent2]
    else
      parents[parent1] = parent2
      rank[parent2] += rank[parent1]
    end

    1
  end

  components = n
  edges.each do |a, b|
    components -= union.call(a, b)
  end

  components
end
