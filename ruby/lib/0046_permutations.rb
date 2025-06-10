# Permutations on distinct integers
def permute(nums)
  permutations = []
  dfs = lambda do |path, set|
    if path.length == nums.length
      permutations << path.dup
      return
    end

    nums.each do |num|
      next if set.include? num

      path << num
      set << num
      dfs.call(path, set)
      path.pop
      set.delete(num)
    end
  end

  dfs.call([], Set.new)
  permutations
end
