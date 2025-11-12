# frozen_string_literal: true

# Bottom-up DP
def max_coins(nums)
  nums << 1
  nums.unshift(1)
  n = nums.length
  dp = Array.new(n) { Array.new(n, 0) }

  (2...n).each do |len|
    (0...(n - len)).each do |left|
      right = left + len
      (left + 1...right).each do |i|
        coins = nums[left] * nums[i] * nums[right]
        coins += dp[left][i] + dp[i][right]
        dp[left][right] = [dp[left][right], coins].max
      end
    end
  end
  dp[0][n - 1]
end

# More clever memoized solution w/ optimizations fails 72/73
def max_coins(nums)
  nums << 1
  nums.unshift(1)
  @nums = nums
  @dp = Array.new(nums.length) { Array.new(nums.length, -1) }
  dfs(1, nums.length - 2)
end

def dfs(l, r)
  return 0 if l > r
  return @dp[l][r] unless @dp[l][r].negative?

  @dp[l][r] = 0
  (l..r).each do |idx|
    coins = @nums[l - 1] * @nums[idx] * @nums[r + 1]
    coins += dfs(l, idx - 1)
    coins += dfs(idx + 1, r)
    @dp[l][r] = coins if coins > @dp[l][r]
  end
  @dp[l][r]
end

# Memoized, exceeds time limit on test case 30/73
# This isn't the proper sub-problem to look for!
def max_coins(nums)
  memo = {}
  dfs = lambda do |balloons|
    return memo[balloons] if memo.key?(balloons)

    coins = 0
    balloons.each_with_index do |balloon, idx|
      copy = balloons.dup
      before = (idx - 1).negative? ? 1 : balloons[idx - 1]
      after = idx + 1 >= balloons.length ? 1 : balloons[idx + 1]
      burst_value = before * after * balloon
      copy.delete_at(idx)
      burst_value += dfs.call(copy)
      coins = [burst_value, coins].max
    end
    memo[balloons] = coins
  end
  dfs.call(nums.dup)
end

# Naive, exceeds time limit on test case 12/73
def max_coins(nums)
  dfs = lambda do |balloons|
    coins = 0
    balloons.each_with_index do |balloon, idx|
      copy = balloons.dup
      before = (idx - 1).negative? ? 1 : balloons[idx - 1]
      after = idx + 1 >= balloons.length ? 1 : balloons[idx + 1]
      burst_value = before * after * balloon
      copy.delete_at(idx)
      burst_value += dfs.call(copy)
      coins = [burst_value, coins].max
    end
    coins
  end
  dfs.call(nums.dup)
end
