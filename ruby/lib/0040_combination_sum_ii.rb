# frozen_string_literal: true

def combination_sum2(candidates, target)
  candidates.sort!
  result = []

  dfs = lambda do |start, sum, path|
    return if sum > target

    if sum == target
      result << path.dup
      return
    end

    (start...candidates.length).each do |index|
      candidate = candidates[index]
      next if index > start && candidates[index] == candidates[index - 1]

      path << candidate
      dfs.call(index + 1, sum + candidate, path)
      path.pop
    end
  end

  dfs.call(0, 0, [])
  result
end
