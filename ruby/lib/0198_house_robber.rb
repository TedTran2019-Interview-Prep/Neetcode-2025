# frozen_string_literal: true

# Naive
def rob(nums)
  dfs = lambda do |index|
    return 0 if index >= nums.length

    nums[index] + [dfs.call(index + 2), dfs.call(index + 3)].max
  end
  [dfs.call(0), dfs.call(1)].max
end

# Memoized
def rob(nums)
  memo = Array.new(nums.length)
  dfs = lambda do |index|
    return 0 if index >= nums.length
    return memo[index] if memo[index]

    two_up = dfs.call(index + 2)
    three_up = dfs.call(index + 3)
    memo[index] = nums[index] + [two_up, three_up].max
  end
  [dfs.call(0), dfs.call(1)].max
end

# DP with array
def rob(nums)
  return nums.first if nums.length == 1

  dp = Array.new(nums.length)
  dp[0] = nums[0]
  dp[1] = nums[1]
  (2...nums.length).each do |idx|
    back_two = dp[idx - 2] || 0
    back_three = dp[idx - 3] || 0
    dp[idx] = [nums[idx] + back_two, nums[idx] + back_three].max
  end
  [dp[-1], dp[-2]].max
end

# DP constant memory
def rob(nums)
  return nums.first if nums.length == 1

  prev_1 = 0
  prev_2 = 0
  nums.each_with_index do |num, idx|
    temp = [num + prev_2, prev_1].max
    prev_2 = prev_1
    prev_1 = temp
  end
  prev_1
end
