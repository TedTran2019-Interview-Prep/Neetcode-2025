# frozen_string_literal: true

def calc_equation(equations, values, queries)
  # Numerator -> Denominator, values[i]
  # Denominator -> Numerator, inverse of values[i]
  graph = Hash.new { |h, k| h[k] = [] }
  equations.each_with_index do |equation, idx|
    a, b = equation
    value = values[idx]
    graph[a] << [b, value]
    graph[b] << [a, 1 / value]
  end

  dfs = lambda do |start, goal, visited|
    return nil if graph[goal].empty? || visited.include?(start)
    return 1.0 if start == goal

    visited << start
    graph[start].each do |node, edge|
      result = dfs.call(node, goal, visited)
      return result * edge if result
    end
    nil
  end

  queries.map { |a, b| dfs.call(a, b, Set.new) || -1.0 }
end
