# frozen_string_literal: true

def can_partition_k_subsets(nums, k)
  portion = nums.sum.fdiv(k)
  return false unless portion == portion.truncate && k <= nums.length

  nums.sort_by! { |num| -num }
  subsets = Array.new(k, 0)
  dfs = lambda do |subsets, start_idx|
    return false if subsets.any? { |subset| subset > portion }
    return subsets.all? { |subset| subset == portion } if start_idx == nums.length

    repeat_subset = Set.new
    subsets.each_with_index do |subset, subset_idx|
      next if repeat_subset.include?(subset)

      repeat_subset << subset
      subsets[subset_idx] += nums[start_idx]
      return true if dfs.call(subsets, start_idx + 1)

      subsets[subset_idx] -= nums[start_idx]
    end
    false
  end
  dfs.call(subsets, 0)
end
