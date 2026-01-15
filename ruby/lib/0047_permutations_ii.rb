# frozen_string_literal: true

def permute_unique(nums)
  tally = nums.tally
  uniq_permutations = []
  dfs = lambda do |permu|
    if permu.length == nums.length
      uniq_permutations << permu.dup
      return
    end

    tally.each do |nbr, count|
      next if count.zero?

      permu << nbr
      tally[nbr] -= 1
      dfs.call(permu)
      permu.pop
      tally[nbr] += 1
    end
  end
  dfs.call([])
  uniq_permutations
end

def permute_unique(nums)
  permutations = Set.new
  repeat_index = Set.new
  dfs = lambda do |permu|
    if permu.length == nums.length
      permutations << permu.dup
      return
    end

    nums.each_with_index do |num, idx|
      next if repeat_index.include?(idx)

      permu << num
      repeat_index << idx
      dfs.call(permu)
      permu.pop
      repeat_index.delete(idx)
    end
  end
  dfs.call([])
  permutations.to_a
end
