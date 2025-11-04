# frozen_string_literal: true

# Space efficient DP
def unique_paths(m, n)
  dp = Array.new(n, 0)
  dp[0] = 1
  m.times do |y|
    n.times do |x|
      next if y.zero? && x.zero?

      top_value = y.zero? ? 0 : dp[x]
      left_value = x.zero? ? 0 : dp[x - 1]
      dp[x] = top_value + left_value
    end
  end
  dp[n - 1]
end

# DP Solution
def unique_paths(m, n)
  dp = Array.new(m) { Array.new(n, 0) }
  dp[0][0] = 1
  m.times do |y|
    n.times do |x|
      next if y.zero? && x.zero?

      top_value = y.zero? ? 0 : dp[y - 1][x]
      left_value = x.zero? ? 0 : dp[y][x - 1]
      dp[y][x] = top_value + left_value
    end
  end
  dp[m - 1][n - 1]
end

# Naive
def unique_paths(m, n)
  dfs = lambda do |y, x|
    return 1 if y == m - 1 && x == n - 1
    return 0 if y.negative? || x.negative? || y >= m || x >= n

    down = dfs.call(y + 1, x)
    right = dfs.call(y, x + 1)
    down + right
  end
  dfs.call(0, 0)
end
