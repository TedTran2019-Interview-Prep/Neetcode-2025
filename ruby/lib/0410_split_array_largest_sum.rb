# frozen_string_literal: true

# Binary search solution
def split_array(nums, k)
  left = nums.max
  right = nums.sum
  while left <= right
    middle = (left + right) / 2

    if all_values_fit?(nums, middle, k)
      right = middle - 1
    else
      left = middle + 1
    end
  end
  left
end

def all_values_fit?(nums, middle, k)
  total = middle
  nums.each do |num|
    return false if num > middle

    if (total - num).negative?
      total = middle - num
      k -= 1
      return false if k.zero?
    else
      total -= num
    end
  end

  true
end

# DP recursive solution that fails
def split_array(nums, k)
  dp = {}
  dfs = lambda do |start_idx, remaining_groups|
    return nums[start_idx..-1].sum if remaining_groups == 1

    key = [start_idx, remaining_groups]
    return dp[key] if dp.key?(key)

    min_split_sum = Float::INFINITY
    current_sum = 0
    (start_idx...(nums.length - remaining_groups + 1)).each do |idx|
      current_sum += nums[idx]
      sum = dfs.call(idx + 1, remaining_groups - 1)
      max_sum = [sum, current_sum].max
      min_split_sum = [max_sum, min_split_sum].min
    end
    dp[key] = min_split_sum
  end
  dfs.call(0, k)
end
