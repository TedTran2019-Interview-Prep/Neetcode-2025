# frozen_string_literal: true

# Non-space optimized DP solution
# Have to do amount - x since index and the number itself are swapped
# E.g, index 4000 refers to amount 0... index 0 refers to amount 4000
def change(amount, coins)
  dp = Array.new(coins.length + 1) { Array.new(amount + 1, 0) }
  coins.length.times { |idx| dp[idx][-1] = 1 }
  (coins.length - 1).downto(0).each do |y|
    (1..amount).each do |x|
      right = x - coins[y]
      right_value = right.negative? ? 0 : dp[y][amount - right]
      down_value = dp[y + 1][amount - x]
      dp[y][amount - x] = right_value + down_value
    end
  end
  dp[0][0]
end

# Okay, I think this is as good as it gets for memoized coin change ii.
def change(amount, coins)
  coins.sort!
  @coins = coins
  @memo = Array.new(amount + 1) { Array.new(coins.length, -1) }
  coin_change(amount, 0)
end

def coin_change(remaining, idx)
  return 0 if remaining < 0
  return 1 if remaining == 0
  return @memo[remaining][idx] unless @memo[remaining][idx] == -1

  combinations = 0
  coin_idx = idx
  while coin_idx < @coins.length
    coin = @coins[coin_idx]
    break if coin > remaining

    combinations += coin_change(remaining - coin, coin_idx)
    coin_idx += 1
  end
  @memo[remaining][idx] = combinations
end

# Changing from using hashmap to array for memo cuts run times significantly (2000 ms)
# Using regular iteration instead of creating an enumerator is a minor optimization (50 ms)
# Doing direct checks instead of calling #zero?, #positive? #negative? (150 ms)
# Using a separate method instead of a lambda saves roughly (400 ms)
# However, this optimized memoized solution still times out on the latter test cases
def change(amount, coins)
  coins.sort!
  memo = Array.new(amount + 1) { Array.new(coins.length, -1) }
  dfs = lambda do |remaining, idx|
    return 0 if remaining.negative?
    return 1 if remaining.zero?
    return memo[remaining][idx] unless memo[remaining][idx] == -1

    combinations = 0
    coin_idx = idx
    while coin_idx < coins.length
      coin = coins[coin_idx]
      break if coin > remaining

      combinations += dfs.call(remaining - coin, coin_idx)
      coin_idx += 1
    end
    memo[remaining][idx] = combinations
  end
  dfs.call(amount, 0)
end

# Memoized solution times out... Ruby is too slow.
def change(amount, coins)
  memo = {}
  coins.sort!
  dfs = lambda do |remaining, idx|
    return 0 if remaining.negative?
    return 1 if remaining.zero?

    key = [remaining, idx]
    return memo[key] if memo.key?(key)

    combinations = 0
    (idx...coins.length).each do |coin_idx|
      coin = coins[coin_idx]
      break if coin > remaining

      combinations += dfs.call(remaining - coin, coin_idx)
    end
    memo[key] = combinations
  end
  dfs.call(amount, 0)
end
