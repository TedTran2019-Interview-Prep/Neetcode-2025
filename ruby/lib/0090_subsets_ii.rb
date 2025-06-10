# frozen_string_literal: true

def subsets_with_dup(nums)
  nums.sort!
  results = []

  dfs = lambda do |start, path|
    results << path.dup
    (start...nums.length).each do |index|
      next if index > start && nums[index] == nums[index - 1]

      path << nums[index]
      dfs.call(index + 1, path)
      path.pop
    end
  end

  dfs.call(0, [])
  results
end
