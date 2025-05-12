def permutations(values)
  stack = []
  results = []
  used = {}

  dfs = lambda do
    if stack.size == values.size
      results << stack.dup
      return
    end

    values.each do |value|
      next if used[value]

      stack << value
      used[value] = true
      dfs.call
      stack.pop
      used[value] = false
    end
  end

  dfs.call
  results
end
