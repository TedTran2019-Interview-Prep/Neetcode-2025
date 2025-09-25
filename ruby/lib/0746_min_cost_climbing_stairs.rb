# frozen_string_literal: true

# Naive
def min_cost_climbing_stairs(cost)
  min_price = Float::INFINITY
  dfs = lambda do |index, price|
    return if index > cost.length

    if index == cost.length
      min_price = [price, min_price].min
      return
    end

    dfs.call(index + 1, price + cost[index])
    dfs.call(index + 2, price + cost[index])
  end
  dfs.call(0, 0)
  dfs.call(1, 0)
  min_price
end

# Naive approach but cleaner
def min_cost_climbing_stairs(cost)
  dfs = lambda do |i|
    return 0 if i >= cost.length

    cost[i] + [dfs.call(i + 1), dfs.call(i + 2)].min
  end

  [dfs.call(0), dfs.call(1)].min
end

# Memoized
def min_cost_climbing_stairs(cost)
  memo = Array.new(cost.length, nil)

  dfs = lambda do |index|
    return 0 if index >= cost.length
    return memo[index] unless memo[index].nil?

    memo[index] = cost[index] + [dfs.call(index + 1), dfs.call(index + 2)].min
  end

  [dfs.call(0), dfs.call(1)].min
end

# DP
def min_cost_climbing_stairs(cost)
  dp = Array.new(cost.length + 1)
  dp[0] = 0
  dp[1] = 0
  (2...dp.length).each do |index|
    minimum = [cost[index - 1] + dp[index - 1], cost[index - 2] + dp[index - 2]].min
    dp[index] = minimum
  end
  dp[-1]
end

# DP no extra space
def min_cost_climbing_stairs(cost)
  prev1 = 0
  prev2 = 0
  (2..cost.length).each do |index|
    minimum = [prev1 + cost[index - 1], prev2 + cost[index - 2]].min
    prev2 = prev1
    prev1 = minimum
  end
  prev1
end
