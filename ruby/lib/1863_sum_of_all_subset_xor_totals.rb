# frozen_string_literal: true

def subset_xor_sum(nums)
  sum = 0
  dfs = lambda do |total, idx|
    return if idx >= nums.length

    (idx...nums.length).each do |start_idx|
      total ^= nums[start_idx]
      sum += total
      dfs.call(total, start_idx + 1)
      total ^= nums[start_idx]
    end
  end
  dfs.call(0, 0)
  sum
end
