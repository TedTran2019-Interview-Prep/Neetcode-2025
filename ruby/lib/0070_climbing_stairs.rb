# frozen_string_literal: true

# Naive approach
def climb_stairs(n)
  count = 0
  dfs = lambda do |steps|
    if steps <= 0
      count += (steps.zero? ? 1 : 0)
      return
    end

    dfs.call(steps - 1)
    dfs.call(steps - 2)
  end
  dfs.call(n)
  count
end

# Shorter naive approach
def climb_stairs(n)
  return 0 if n.negative?
  return 1 if n.zero?

  climb_stairs(n - 1) + climb_stairs(n - 2)
end

# Memoized approach
def climb_stairs(n)
  memo = Array.new(n + 1)
  dfs = lambda do |steps|
    return 0 if steps.negative?
    return 1 if steps.zero?

    memo[steps - 1] ||= dfs.call(steps - 1)
    memo[steps - 2] ||= dfs.call(steps - 2)

    memo[steps - 1] + memo[steps - 2]
  end
  dfs.call(n)
end

# Bottom-up approach
def climb_stairs(n)
  dp = Array.new(n + 1)
  dp[0] = 0
  dp[1] = 1
  dp[2] = 2
  (3...dp.length).each { |idx| dp[idx] = dp[idx - 1] + dp[idx - 2] }
  dp[n]
end

# Bottom-up approach with no array
def climb_stairs(n)
  return 0 if n <= 0
  return 1 if n == 1
  return 2 if n == 2

  prev1 = 2
  prev2 = 1
  (3..n).each do |steps|
    current = prev1 + prev2
    prev2 = prev1
    prev1 = current
  end
  prev1
end
