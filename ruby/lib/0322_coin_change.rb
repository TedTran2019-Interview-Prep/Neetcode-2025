# frozen_string_literal: true

# Bottom-up DP
def coin_change(coins, amount)
  dp = Array.new(amount + 1, amount + 1)
  dp[0] = 0
  (1..amount).each do |count|
    coins.each do |coin|
      dp[count] = [dp[count], 1 + dp[count - coin]].min if count - coin >= 0
    end
  end
  dp[amount] == amount + 1 ? -1 : dp[amount]
end

# Memoized
def coin_change(coins, amount)
  memo = { amount => 0 }
  dfs = lambda do |total|
    return memo[total] if memo[total]
    return 0 if total > amount

    result = Float::INFINITY
    coins.each do |coin|
      next if coin + total > amount

      result = [dfs.call(total + coin), result].min
    end
    # Minimum coins + coin just used
    memo[total] = result + 1
  end
  minimum_coins = dfs.call(0)
  minimum_coins == Float::INFINITY ? -1 : minimum_coins
end

# Naive
def coin_change(coins, amount)
  coins = coins.sort { |a, b| b <=> a }
  minimum_coins = Float::INFINITY
  dfs = lambda do |remaining, number_coins|
    return if remaining.negative?
    return if number_coins >= minimum_coins

    if remaining.zero?
      minimum_coins = number_coins
      return
    end

    coins.each do |coin|
      next if coin > remaining

      dfs.call(remaining - coin, number_coins += 1)
    end
  end
  dfs.call(amount, 0)
  return -1 if minimum_coins == Float::INFINITY

  minimum_coins
end
