def combinations(values)
  stack = []
  results = []

  dfs = lambda do |start_index|
    results << stack.dup

    (start_index...values.size).each do |idx|
      stack << values[idx]
      dfs.call(idx + 1)
      stack.pop
    end
  end

  dfs.call(0)
  results
end
