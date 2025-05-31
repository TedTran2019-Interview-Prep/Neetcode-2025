def generate_permutations(nums)
  results = []
  stack = []
  set = Set.new
  dfs = lambda do
    results << stack.dup if stack.length == nums.length

    nums.each do |num|
      next if set.include?(num)

      stack << num
      set << num
      dfs.call
      stack.pop
      set.delete(num)
    end
  end

  dfs.call
  results
end
