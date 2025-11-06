# frozen_string_literal: true

# Bottom-up DP Solution
def find_target_sum_ways(nums, target)
  dp = Hash.new(0)
  dp[0] = 1 # using 0 numbers, sum 0 is only achievable in 1 way

  nums.each do |num|
    new_dp = Hash.new(0)
    dp.each do |sum, count|
      new_dp[sum + num] += count
      new_dp[sum - num] += count
    end
    dp = new_dp
  end

  dp[target]
end

# Memoized Solution
def find_target_sum_ways(nums, target)
  memo = {}
  dfs = lambda do |index, sum|
    return target == sum ? 1 : 0 if index == nums.length

    key = [index, sum]
    return memo[key] if memo.key?(key)

    num = nums[index]
    plus = dfs.call(index + 1, sum + num)
    minus = dfs.call(index + 1, sum - num)
    memo[key] = plus + minus
  end
  dfs.call(0, 0)
end

# Naive
def find_target_sum_ways(nums, target)
  dfs = lambda do |index, sum|
    return target == sum ? 1 : 0 if index == nums.length

    num = nums[index]
    plus = dfs.call(index + 1, sum + num)
    minus = dfs.call(index + 1, sum - num)
    plus + minus
  end
  dfs.call(0, 0)
end
