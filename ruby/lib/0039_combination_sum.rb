# frozen_string_literal: true

def combination_sum(candidates, target)
  results = []

  dfs = lambda do |start, path, sum|
    return if sum > target

    if sum == target
      results << path.dup
      return
    end

    (start...candidates.length).each do |index|
      path << candidates[index]
      dfs.call(index, path, sum + candidates[index])
      path.pop
    end
  end

  dfs.call(0, [], 0)
  results
end
